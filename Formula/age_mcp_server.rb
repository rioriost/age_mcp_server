class AgeMcpServer < Formula
  include Language::Python::Virtualenv

  desc "Apache AGE MCP Server"
  homepage "https://github.com/rioriost/age_mcp_server"
  url "https://github.com/rioriost/age_mcp_server/releases/download/0.2.47/age_mcp_server-0.2.47.tar.gz"
  sha256 "4ed33968f0fbe66b9d99bff0f2e07bcd0c7a82fbca0827dd9eae70acb07f34c9"
  license "MIT"

  depends_on "python@3.13"
  resource "agefreighter" do
    url "https://files.pythonhosted.org/packages/27/f2/3aa26243b7d4615fd2d6b6a2d2bc9614a4780340bcf48265343e4cdeda34/agefreighter-1.0.33-py3-none-any.whl"
    sha256 "4cb593e45b953f68a1073bd5a0cfe64779e5ea81b19f87bd0aeba04b854f10d4"
  end
  resource "aiofiles" do
    url "https://files.pythonhosted.org/packages/bc/8a/340a1555ae33d7354dbca4faa54948d76d89a27ceef032c8c3bc661d003e/aiofiles-25.1.0-py3-none-any.whl"
    sha256 "abe311e527c862958650f9438e859c1fa7568a141b22abcd015e120e86a85695"
  end
  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/78/b6/6307fbef88d9b5ee7421e68d78a9f162e0da4900bc5f5793f6d3d0e34fb8/annotated_types-0.7.0-py3-none-any.whl"
    sha256 "1f02e8b43a8fbbc3f3e0d4f0f4bfc8131bcb4eebe8849b8e5c773f3a1c582a53"
  end
  resource "anyio" do
    url "https://files.pythonhosted.org/packages/38/0e/27be9fdef66e72d64c0cdc3cc2823101b80585f8119b5c112c2e8f5f7dab/anyio-4.12.1-py3-none-any.whl"
    sha256 "d405828884fc140aa80a3c667b8beed277f1dfedec42ba031bd6ac3db606ab6c"
  end
  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/74/f5/9373290775639cb67a2fce7f629a1c240dce9f12fe927bc32b2736e16dfc/argcomplete-3.6.3-py3-none-any.whl"
    sha256 "f5007b3a600ccac5d25bbce33089211dfd49eab4a7718da3f10e3082525a92ce"
  end
  resource "attrs" do
    url "https://files.pythonhosted.org/packages/64/b4/17d4b0b2a2dc85a6df63d1157e028ed19f90d4cd97c36717afef2bc2f395/attrs-26.1.0-py3-none-any.whl"
    sha256 "c647aa4a12dfbad9333ca4e71fe62ddc36f4e63b2d260a37a8b83d2f043ac309"
  end
  resource "certifi" do
    url "https://files.pythonhosted.org/packages/9a/3c/c17fb3ca2d9c3acff52e30b309f538586f9f5b9c9cf454f3845fc9af4881/certifi-2026.2.25-py3-none-any.whl"
    sha256 "027692e4402ad994f1c42e52a4997a9763c646b73e4096e4d5d6db8af1d6f0fa"
  end
  resource "click" do
    url "https://files.pythonhosted.org/packages/98/78/01c019cdb5d6498122777c1a43056ebb3ebfeef2076d9d026bfe15583b2b/click-8.3.1-py3-none-any.whl"
    sha256 "981153a64e25f12d547d3426c367a4857371575ee7ad18df2a6183ab0545b2a6"
  end
  resource "h11" do
    url "https://files.pythonhosted.org/packages/04/4b/29cac41a4d98d144bf5f6d33995617b185d14b22401f75ca86f384e87ff1/h11-0.16.0-py3-none-any.whl"
    sha256 "63cf8bbe7522de3bf65932fda1d9c2772064ffb3dae62d55932da54b31cb6c86"
  end
  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/7e/f5/f66802a942d491edb555dd61e3a9961140fd64c90bce1eafd741609d334d/httpcore-1.0.9-py3-none-any.whl"
    sha256 "2d400746a40668fc9dec9810239072b40b4484b640a8c38fd654a024c7a1bf55"
  end
  resource "httpx" do
    url "https://files.pythonhosted.org/packages/2a/39/e50c7c3a983047577ee07d2a9e53faf5a69493943ec3f6a384bdc792deb2/httpx-0.28.1-py3-none-any.whl"
    sha256 "d909fcccc110f8c7faf814ca82a9a4d816bc5a6dbfea25d6591d6985b8ba59ad"
  end
  resource "httpx-sse" do
    url "https://files.pythonhosted.org/packages/d2/fd/6668e5aec43ab844de6fc74927e155a3b37bf40d7c3790e49fc0406b6578/httpx_sse-0.4.3-py3-none-any.whl"
    sha256 "0ac1c9fe3c0afad2e0ebb25a934a59f4c7823b60792691f779fad2c5568830fc"
  end
  resource "idna" do
    url "https://files.pythonhosted.org/packages/0e/61/66938bbb5fc52dbdf84594873d5b51fb1f7c7794e9c0f5bd885f30bc507b/idna-3.11-py3-none-any.whl"
    sha256 "771a87f49d9defaf64091e6e6fe9c18d4833f140bd19464795bc32d966ca37ea"
  end
  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/69/90/f63fb5873511e014207a475e2bb4e8b2e570d655b00ac19a9a0ca0a385ee/jsonschema-4.26.0-py3-none-any.whl"
    sha256 "d489f15263b8d200f8387e64b4c3a75f06629559fb73deb8fdfb525f2dab50ce"
  end
  resource "jsonschema-specifications" do
    url "https://files.pythonhosted.org/packages/41/45/1a4ed80516f02155c51f51e8cedb3c1902296743db0bbc66608a0db2814f/jsonschema_specifications-2025.9.1-py3-none-any.whl"
    sha256 "98802fee3a11ee76ecaca44429fda8a41bff98b00a0f2838151b113f210cc6fe"
  end
  resource "mcp" do
    url "https://files.pythonhosted.org/packages/fd/d9/eaa1f80170d2b7c5ba23f3b59f766f3a0bb41155fbc32a69adfa1adaaef9/mcp-1.26.0-py3-none-any.whl"
    sha256 "904a21c33c25aa98ddbeb47273033c435e595bbacfdb177f4bd87f6dceebe1ca"
  end
  resource "numpy" do
    if OS.mac? && Hardware::CPU.arm?
      url "https://files.pythonhosted.org/packages/27/d9/4e7c3f0e68dfa91f21c6fb6cf839bc829ec920688b1ce7ec722b1a6202fb/numpy-2.4.3-cp313-cp313-macosx_11_0_arm64.whl"
      sha256 "2629289168f4897a3c4e23dc98d6f1731f0fc0fe52fb9db19f974041e4cc12b9"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://files.pythonhosted.org/packages/b6/d0/1fe47a98ce0df229238b77611340aff92d52691bcbc10583303181abf7fc/numpy-2.4.3-cp313-cp313-macosx_10_13_x86_64.whl"
      sha256 "b346845443716c8e542d54112966383b448f4a3ba5c66409771b8c0889485dd3"
    elsif OS.linux?
      url "https://files.pythonhosted.org/packages/7e/eb/7daecbea84ec935b7fc732e18f532073064a3816f0932a40a17f3349185f/numpy-2.4.3-cp313-cp313-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl"
      sha256 "d5f51900414fc9204a0e0da158ba2ac52b75656e7dce7e77fb9f84bfa343b4cc"
    else
      url "https://files.pythonhosted.org/packages/10/8b/c265f4823726ab832de836cdd184d0986dcf94480f81e8739692a7ac7af2/numpy-2.4.3.tar.gz"
      sha256 "483a201202b73495f00dbc83796c6ae63137a9bdade074f7648b3e32613412dd"
    end
  end
  resource "ply" do
    url "https://files.pythonhosted.org/packages/a3/58/35da89ee790598a0700ea49b2a66594140f44dec458c07e8e3d4979137fc/ply-3.11-py2.py3-none-any.whl"
    sha256 "096f9b8350b65ebd2fd1346b12452efe5b9607f7482813ffca50c22722a807ce"
  end
  resource "psycopg" do
    url "https://files.pythonhosted.org/packages/c8/5b/181e2e3becb7672b502f0ed7f16ed7352aca7c109cfb94cf3878a9186db9/psycopg-3.3.3-py3-none-any.whl"
    sha256 "f96525a72bcfade6584ab17e89de415ff360748c766f0106959144dcbb38c698"
  end
  resource "psycopg-pool" do
    url "https://files.pythonhosted.org/packages/e7/c3/26b8a0908a9db249de3b4169692e1c7c19048a9bc41a4d3209cee7dbb758/psycopg_pool-3.3.0-py3-none-any.whl"
    sha256 "2e44329155c410b5e8666372db44276a8b1ebd8c90f1c3026ebba40d4bc81063"
  end
  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/5a/87/b70ad306ebb6f9b585f114d0ac2137d792b48be34d732d60e597c2f8465a/pydantic-2.12.5-py3-none-any.whl"
    sha256 "e561593fccf61e8a20fc46dfc2dfe075b8be7d0188df33f221ad1f0139180f9d"
  end
  resource "pydantic-core" do
    if OS.mac? && Hardware::CPU.arm?
      url "https://files.pythonhosted.org/packages/94/02/abfa0e0bda67faa65fef1c84971c7e45928e108fe24333c81f3bfe35d5f5/pydantic_core-2.41.5-cp313-cp313-macosx_11_0_arm64.whl"
      sha256 "112e305c3314f40c93998e567879e887a3160bb8689ef3d2c04b6cc62c33ac34"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://files.pythonhosted.org/packages/87/06/8806241ff1f70d9939f9af039c6c35f2360cf16e93c2ca76f184e76b1564/pydantic_core-2.41.5-cp313-cp313-macosx_10_12_x86_64.whl"
      sha256 "941103c9be18ac8daf7b7adca8228f8ed6bb7a1849020f643b3a14d15b1924d9"
    elsif OS.linux?
      url "https://files.pythonhosted.org/packages/cf/4e/35a80cae583a37cf15604b44240e45c05e04e86f9cfd766623149297e971/pydantic_core-2.41.5-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
      sha256 "406bf18d345822d6c21366031003612b9c77b3e29ffdb0f612367352aab7d586"
    else
      url "https://files.pythonhosted.org/packages/71/70/23b021c950c2addd24ec408e9ab05d59b035b39d97cdc1130e1bce647bb6/pydantic_core-2.41.5.tar.gz"
      sha256 "08daa51ea16ad373ffd5e7606252cc32f07bc72b28284b6bc9c6df804816476e"
    end
  end
  resource "pydantic-settings" do
    url "https://files.pythonhosted.org/packages/00/4b/ccc026168948fec4f7555b9164c724cf4125eac006e176541483d2c959be/pydantic_settings-2.13.1-py3-none-any.whl"
    sha256 "d56fd801823dbeae7f0975e1f8c8e25c258eb75d278ea7abb5d9cebb01b56237"
  end
  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/0b/d7/1959b9648791274998a9c3526f6d0ec8fd2233e4d4acce81bbae76b44b2a/python_dotenv-1.2.2-py3-none-any.whl"
    sha256 "1d8214789a24de455a8b8bd8ae6fe3c6b69a5e3d64aa8a8e5d68e694bbcb285a"
  end
  resource "python-multipart" do
    url "https://files.pythonhosted.org/packages/1b/d0/397f9626e711ff749a95d96b7af99b9c566a9bb5129b8e4c10fc4d100304/python_multipart-0.0.22-py3-none-any.whl"
    sha256 "2b2cd894c83d21bf49d702499531c7bafd057d730c201782048f7945d82de155"
  end
  resource "referencing" do
    url "https://files.pythonhosted.org/packages/2c/58/ca301544e1fa93ed4f80d724bf5b194f6e4b945841c5bfd555878eea9fcb/referencing-0.37.0-py3-none-any.whl"
    sha256 "381329a9f99628c9069361716891d34ad94af76e461dcb0335825aecc7692231"
  end
  resource "rpds-py" do
    if OS.mac? && Hardware::CPU.arm?
      url "https://files.pythonhosted.org/packages/fd/32/55fb50ae104061dbc564ef15cc43c013dc4a9f4527a1f4d99baddf56fe5f/rpds_py-0.30.0-cp313-cp313-macosx_11_0_arm64.whl"
      sha256 "e7536cd91353c5273434b4e003cbda89034d67e7710eab8761fd918ec6c69cf8"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://files.pythonhosted.org/packages/ed/dc/d61221eb88ff410de3c49143407f6f3147acf2538c86f2ab7ce65ae7d5f9/rpds_py-0.30.0-cp313-cp313-macosx_10_12_x86_64.whl"
      sha256 "f83424d738204d9770830d35290ff3273fbb02b41f919870479fab14b9d303b2"
    elsif OS.linux?
      url "https://files.pythonhosted.org/packages/b7/de/f7192e12b21b9e9a68a6d0f249b4af3fdcdff8418be0767a627564afa1f1/rpds_py-0.30.0-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
      sha256 "9027da1ce107104c50c81383cae773ef5c24d296dd11c99e2629dbd7967a20c6"
    else
      url "https://files.pythonhosted.org/packages/20/af/3f2f423103f1113b36230496629986e0ef7e199d2aa8392452b484b38ced/rpds_py-0.30.0.tar.gz"
      sha256 "dd8ff7cf90014af0c0f787eea34794ebf6415242ee1d6fa91eaba725cc441e84"
    end
  end
  resource "shtab" do
    url "https://files.pythonhosted.org/packages/8e/e1/202a31727b0d096a04380f78e809074d7a1d0a22d9d5a39fea1d2353fd02/shtab-1.8.0-py3-none-any.whl"
    sha256 "f0922a82174b4007e06ac0bac4f79abd826c5cca88e201bfd927f889803c571d"
  end
  resource "sse-starlette" do
    url "https://files.pythonhosted.org/packages/78/e2/b8cff57a67dddf9a464d7e943218e031617fb3ddc133aeeb0602ff5f6c85/sse_starlette-3.3.3-py3-none-any.whl"
    sha256 "c5abb5082a1cc1c6294d89c5290c46b5f67808cfdb612b7ec27e8ba061c22e8d"
  end
  resource "starlette" do
    url "https://files.pythonhosted.org/packages/81/0d/13d1d239a25cbfb19e740db83143e95c772a1fe10202dda4b76792b114dd/starlette-0.52.1-py3-none-any.whl"
    sha256 "0029d43eb3d273bc4f83a08720b4912ea4b071087a3b48db01b7c839f7954d74"
  end
  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/18/67/36e9267722cc04a6b9f15c7f3441c2363321a3ea07da7ae0c0707beb2a9c/typing_extensions-4.15.0-py3-none-any.whl"
    sha256 "f0fa19c6845758ab08074a0cfa8b7aecb71c999ca73d62883bc25cc018c4e548"
  end
  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/dc/9b/47798a6c91d8bdb567fe2698fe81e0c6b7cb7ef4d13da4114b41d239f65d/typing_inspection-0.4.2-py3-none-any.whl"
    sha256 "4ed1cacbdc298c220f1bd249ed5287caa16f34d44ef4e9c3d0cbad5b521545e7"
  end
  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/0a/89/f8827ccff89c1586027a105e5630ff6139a64da2515e24dafe860bd9ae4d/uvicorn-0.42.0-py3-none-any.whl"
    sha256 "96c30f5c7abe6f74ae8900a70e92b85ad6613b745d4879eb9b16ccad15645359"
  end

  def install
    venv = virtualenv_create(libexec, "python3.13")

    resource("agefreighter").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("aiofiles").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("annotated-types").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("anyio").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("argcomplete").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("attrs").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("certifi").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("click").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("h11").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("httpcore").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("httpx").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("httpx-sse").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("idna").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("jsonschema").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("jsonschema-specifications").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("mcp").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("numpy").stage do
      if OS.mac? && Hardware::CPU.arm?
        venv.pip_install Pathname(Dir["*.whl"].first)
      elsif OS.mac? && Hardware::CPU.intel?
        venv.pip_install Pathname(Dir["*.whl"].first)
      elsif OS.linux?
        venv.pip_install Pathname(Dir["*.whl"].first)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("ply").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("psycopg").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("psycopg-pool").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("pydantic").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("pydantic-core").stage do
      if OS.mac? && Hardware::CPU.arm?
        venv.pip_install Pathname(Dir["*.whl"].first)
      elsif OS.mac? && Hardware::CPU.intel?
        venv.pip_install Pathname(Dir["*.whl"].first)
      elsif OS.linux?
        venv.pip_install Pathname(Dir["*.whl"].first)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("pydantic-settings").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("python-dotenv").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("python-multipart").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("referencing").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("rpds-py").stage do
      if OS.mac? && Hardware::CPU.arm?
        venv.pip_install Pathname(Dir["*.whl"].first)
      elsif OS.mac? && Hardware::CPU.intel?
        venv.pip_install Pathname(Dir["*.whl"].first)
      elsif OS.linux?
        venv.pip_install Pathname(Dir["*.whl"].first)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("shtab").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("sse-starlette").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("starlette").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("typing-extensions").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("typing-inspection").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    resource("uvicorn").stage do
      wheel = Dir["*.whl"].first
      if wheel
        venv.pip_install Pathname(wheel)
      else
        venv.pip_install Pathname.pwd
      end
    end

    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/age_mcp_server"
  end

  test do
    system "#{bin}/age_mcp_server", "--help"
  end
end
