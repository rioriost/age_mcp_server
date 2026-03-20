#!/usr/bin/env python3
"""Generate a Homebrew formula for age-mcp-server from project metadata and PyPI."""

from __future__ import annotations

import argparse
import json
import re
import sys
import urllib.error
import urllib.request
from dataclasses import dataclass
from pathlib import Path
from typing import Any

try:
    import tomllib
except ModuleNotFoundError:  # pragma: no cover
    import tomli as tomllib  # type: ignore[no-redef]

PYPI_URL_TEMPLATE = "https://pypi.org/pypi/{name}/json"

ROOT_DIR = Path(__file__).resolve().parent.parent
PYPROJECT_PATH = ROOT_DIR / "pyproject.toml"
DEFAULT_OUTPUT = ROOT_DIR / "Formula" / "age-mcp-server.rb"
DEFAULT_PYTHON = "python@3.13"

SKIP_RESOURCE_PACKAGES = {
    "mcp",
    "psycopg",
    "psycopg-binary",
    "psycopg-pool",
    "python",
    "pip",
    "setuptools",
    "wheel",
}


@dataclass
class PackageRelease:
    name: str
    version: str
    sdist_url: str
    sdist_sha256: str
    summary: str = ""
    homepage: str = ""
    license_name: str = ""


def fetch_json(url: str) -> dict[str, Any]:
    req = urllib.request.Request(
        url,
        headers={
            "Accept": "application/json",
            "User-Agent": "age-mcp-server formula generator",
        },
    )
    with urllib.request.urlopen(req, timeout=30) as response:
        return json.load(response)


def select_sdist(files: list[dict[str, Any]], package_name: str, version: str) -> dict[str, Any]:
    for file_info in files:
        if file_info.get("packagetype") == "sdist":
            return file_info
    raise RuntimeError(f"No source distribution found for {package_name}=={version}")


def normalize_homepage(info: dict[str, Any]) -> str:
    project_urls = info.get("project_urls") or {}
    for key in ("Homepage", "Repository", "Source", "Issues"):
        value = project_urls.get(key)
        if value:
            return value

    home_page = info.get("home_page")
    if home_page:
        return home_page

    package_url = info.get("package_url")
    if package_url:
        return package_url

    return f"https://pypi.org/project/{info['name']}/"


def normalize_license(info: dict[str, Any]) -> str:
    license_name = (info.get("license") or "").strip()
    if license_name:
        return license_name

    classifiers = info.get("classifiers") or []
    for classifier in classifiers:
        if classifier.startswith("License ::"):
            parts = classifier.split("::")
            return parts[-1].strip()

    return "Unknown"


def fetch_pypi_package(package_name: str, version: str | None = None) -> PackageRelease:
    payload = fetch_json(PYPI_URL_TEMPLATE.format(name=package_name))
    info = payload["info"]
    resolved_version = version or info["version"]

    if version is None:
        files = payload["urls"]
    else:
        files = (payload.get("releases") or {}).get(version, [])

    sdist = select_sdist(files, package_name, resolved_version)

    return PackageRelease(
        name=package_name,
        version=resolved_version,
        sdist_url=sdist["url"],
        sdist_sha256=sdist["digests"]["sha256"],
        summary=info.get("summary") or "",
        homepage=normalize_homepage(info),
        license_name=normalize_license(info),
    )


def github_release_url(project_name: str, version: str) -> str:
    filename = f"{project_name.replace('-', '_')}-{version}.tar.gz"
    return f"https://github.com/rioriost/{project_name}/releases/download/{version}/{filename}"


def sha256_file(path: Path) -> str:
    import hashlib

    digest = hashlib.sha256()
    with path.open("rb") as fp:
        for chunk in iter(lambda: fp.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def find_local_sdist(package_name: str, version: str) -> Path | None:
    normalized = package_name.replace("-", "_")
    candidates = [
        ROOT_DIR / "dist" / f"{normalized}-{version}.tar.gz",
        ROOT_DIR / "dist" / f"{package_name}-{version}.tar.gz",
    ]
    for candidate in candidates:
        if candidate.exists():
            return candidate
    return None


def fetch_main_package_release(package_name: str, version: str) -> PackageRelease:
    payload = fetch_json(PYPI_URL_TEMPLATE.format(name=package_name))
    info = payload["info"]

    release_files = (payload.get("releases") or {}).get(version, [])
    if release_files:
        sdist = select_sdist(release_files, package_name, version)
        sdist_sha256 = sdist["digests"]["sha256"]
    else:
        local_sdist = find_local_sdist(package_name, version)
        if local_sdist is None:
            raise RuntimeError(f"No release artifact found for {package_name}=={version}")
        sdist_sha256 = sha256_file(local_sdist)

    return PackageRelease(
        name=package_name,
        version=version,
        sdist_url=github_release_url(package_name, version),
        sdist_sha256=sdist_sha256,
        summary=info.get("summary") or "",
        homepage=normalize_homepage(info),
        license_name=normalize_license(info),
    )


def read_pyproject(path: Path) -> dict[str, Any]:
    with path.open("rb") as fp:
        return tomllib.load(fp)


def normalize_project_license(license_value: Any) -> str:
    if isinstance(license_value, str) and license_value.strip():
        return license_value.strip()

    if isinstance(license_value, dict):
        text = str(license_value.get("text") or "").strip()
        if text:
            return text
        file_name = str(license_value.get("file") or "").strip()
        if file_name:
            if file_name.upper() == "LICENSE":
                return "MIT"
            return file_name

    return "MIT"


def parse_python_dependency(requires_python: str | None) -> str:
    if not requires_python:
        return DEFAULT_PYTHON

    match = re.search(r">=\s*3\.(\d+)", requires_python)
    if match:
        return f"python@3.{match.group(1)}"

    return DEFAULT_PYTHON


def ruby_string(value: str) -> str:
    return value.replace("\\", "\\\\").replace('"', '\\"')


def normalize_spec_name(spec: str) -> str:
    name = spec.strip()

    if ";" in name:
        name = name.split(";", 1)[0].strip()

    if "[" in name:
        name = name.split("[", 1)[0].strip()

    for marker in ("==", ">=", "<=", "!=", "~=", ">", "<"):
        if marker in name:
            name = name.split(marker, 1)[0].strip()
            break

    if "(" in name:
        name = name.split("(", 1)[0].strip()

    return name


def resource_names_from_dependencies(dependencies: list[str]) -> list[str]:
    seen: set[str] = set()
    resources: list[str] = []

    for dependency in dependencies:
        package_name = normalize_spec_name(dependency)
        if not package_name:
            continue
        if package_name in SKIP_RESOURCE_PACKAGES:
            continue
        if package_name == "age-mcp-server":
            continue
        if package_name in seen:
            continue

        seen.add(package_name)
        resources.append(package_name)

    return resources


def formula_class_name(project_name: str) -> str:
    return "".join(part.capitalize() for part in re.split(r"[-_]+", project_name) if part)


def formula_filename(project_name: str) -> str:
    return f"{project_name}.rb"


def render_resource_block(pkg: PackageRelease) -> str:
    return (
        f'  resource "{pkg.name}" do\n'
        f'    url "{ruby_string(pkg.sdist_url)}"\n'
        f'    sha256 "{pkg.sdist_sha256}"\n'
        f"  end\n"
    )


def render_formula(
    *,
    class_name: str,
    desc: str,
    homepage: str,
    source_url: str,
    source_sha256: str,
    license_name: str,
    python_formula: str,
    resources: list[PackageRelease],
    cli_name: str,
) -> str:
    resource_blocks = "\n".join(render_resource_block(resource).rstrip() for resource in resources)

    resources_section = f"\n{resource_blocks}\n" if resource_blocks else "\n"

    return f"""class {class_name} < Formula
  include Language::Python::Virtualenv

  desc "{ruby_string(desc)}"
  homepage "{ruby_string(homepage)}"
  url "{ruby_string(source_url)}"
  sha256 "{source_sha256}"
  license "{ruby_string(license_name)}"

  depends_on "{python_formula}"{resources_section}
  def install
    virtualenv_install_with_resources
    system libexec/"bin/python", "-m", "pip", "install", "mcp", "psycopg", "psycopg-pool"
  end

  test do
    system "#{{bin}}/{ruby_string(cli_name)}", "--help"
  end
end
"""


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a Homebrew formula from pyproject.toml and PyPI metadata."
    )
    parser.add_argument(
        "--pyproject",
        type=Path,
        default=PYPROJECT_PATH,
        help=f"Path to pyproject.toml (default: {PYPROJECT_PATH})",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=None,
        help="Output path for the formula. Defaults to Formula/<project-name>.rb.",
    )
    parser.add_argument(
        "--version",
        help="Specific version of the main package to generate. Defaults to project version.",
    )
    parser.add_argument(
        "--stdout",
        action="store_true",
        help="Print the generated formula to stdout instead of writing a file.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()

    try:
        pyproject = read_pyproject(args.pyproject)
        project = pyproject["project"]
    except FileNotFoundError:
        print(f"pyproject.toml not found: {args.pyproject}", file=sys.stderr)
        return 1
    except KeyError:
        print("Invalid pyproject.toml: missing [project] table", file=sys.stderr)
        return 1

    project_name = str(project["name"])
    project_version = str(project["version"])
    project_desc = str(project.get("description") or "Apache AGE MCP Server")
    project_urls = project.get("urls") or {}
    project_homepage = str(
        project_urls.get("Homepage")
        or project_urls.get("Repository")
        or f"https://pypi.org/project/{project_name}/"
    )
    project_license = normalize_project_license(project.get("license"))
    requires_python = project.get("requires-python")
    dependencies = list(project.get("dependencies") or [])
    scripts = project.get("scripts") or {}

    if not scripts:
        print("Invalid pyproject.toml: missing [project.scripts] entry", file=sys.stderr)
        return 1

    cli_name = next(iter(scripts.keys()))
    class_name = formula_class_name(project_name)
    output_path = args.output or (ROOT_DIR / "Formula" / formula_filename(project_name))
    main_version = args.version or project_version
    resource_names = resource_names_from_dependencies(dependencies)

    try:
        main_pkg = fetch_main_package_release(project_name, main_version)
        resources = [fetch_pypi_package(name) for name in resource_names]
        python_formula = parse_python_dependency(
            requires_python
            or fetch_json(PYPI_URL_TEMPLATE.format(name=project_name))["info"].get(
                "requires_python"
            )
        )
        formula = render_formula(
            class_name=class_name,
            desc=project_desc or main_pkg.summary or "Apache AGE MCP Server",
            homepage=project_homepage or main_pkg.homepage,
            source_url=main_pkg.sdist_url,
            source_sha256=main_pkg.sdist_sha256,
            license_name=project_license or main_pkg.license_name or "MIT",
            python_formula=python_formula,
            resources=resources,
            cli_name=cli_name,
        )
    except urllib.error.URLError as exc:
        print(f"Failed to fetch PyPI metadata: {exc}", file=sys.stderr)
        return 1
    except RuntimeError as exc:
        print(str(exc), file=sys.stderr)
        return 1

    if args.stdout:
        sys.stdout.write(formula)
        return 0

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(formula, encoding="utf-8")
    print(f"Wrote {output_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
