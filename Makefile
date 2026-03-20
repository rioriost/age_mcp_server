SHELL := /bin/sh

REPO_ROOT := $(CURDIR)
UV ?= uv
PYTHON ?= python3

DIST_DIR := $(REPO_ROOT)/dist
FORMULA_DIR := $(REPO_ROOT)/Formula
FORMULA_FILE := $(FORMULA_DIR)/age_mcp_server.rb

.PHONY: release-artifacts sync build formula

release-artifacts: sync build formula

sync:
	$(UV) sync --extra test --group dev

build:
	$(UV) build

formula:
	mkdir -p "$(FORMULA_DIR)"
	genformula \
		--pyproject "$(REPO_ROOT)/pyproject.toml" \
		--install-mode advanced \
		--source-subdir . \
		--output "$(FORMULA_FILE)"
