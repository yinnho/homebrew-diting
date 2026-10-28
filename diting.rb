class Diting < Formula
  desc "Engine-first browser for AI agents. One Rust binary, built-in V8, no Chromium"
  homepage "https://github.com/yinnho/diting"
  version "0.8.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yinnho/diting/releases/download/v0.8.3/diting-v0.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "490c965f2f9130df5b56327c32c09f0ba14d96e5c87e7ef65aa8e779d2e25fa1"
    elsif Hardware::CPU.arm?
      url "https://github.com/yinnho/diting/releases/download/v0.8.3/diting-v0.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "1679d2be606929797e18e749bf318f5ae8c893c9a22089e7821c6adfec23b5fe"
    end
  end

  def install
    bin.install "diting"
  end

  def caveats
    <<~EOS
      Start the server: diting  (listens on 0.0.0.0:8089)
      Verify:           curl http://127.0.0.1:8089/health
      Self-check:       diting doctor
    EOS
  end

  test do
    assert_match "diting", shell_output("#{bin}/diting --version")
  end
end