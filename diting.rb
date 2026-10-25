class Diting < Formula
  desc "Engine-first browser for AI agents. One Rust binary, built-in V8, no Chromium"
  homepage "https://github.com/yinnho/diting"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/yinnho/diting/releases/download/v0.7.0/diting-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "9f3b8fe946a489533011e5b9bc227505f6f0c3bbf665537fb0b5090bac6fac63"
    elsif Hardware::CPU.arm?
      url "https://github.com/yinnho/diting/releases/download/v0.7.0/diting-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "238e79051bd7bcf6e1c4170e49eead01c9a01b8bad4bf93c34075b1be67d3b77"
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
