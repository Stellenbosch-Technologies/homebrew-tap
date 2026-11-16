class Rhebok < Formula
  desc "Local semantic search over your notes and past sessions for coding agents"
  homepage "https://github.com/Stellenbosch-Technologies/rhebok"
  version "0.2.0"
  license "AGPL-3.0-only"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/Stellenbosch-Technologies/rhebok/releases/download/v0.2.0/rhebok-aarch64-apple-darwin.tar.gz"
    sha256 "5ef360997d047f9d78daadd2676c7f672203755278045299c67c1bd50a5480e1"
  end

  on_linux do
    on_intel do
      url "https://github.com/Stellenbosch-Technologies/rhebok/releases/download/v0.2.0/rhebok-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e85435c84a4306b919c0e77bdfa9c69fcb4e19b89dcd20081fa1fc74e9682274"
    end
    on_arm do
      url "https://github.com/Stellenbosch-Technologies/rhebok/releases/download/v0.2.0/rhebok-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bfaf0a44e029e3196698b54c2d96c376369dab527d044f1ec892b93c5b99d676"
    end
  end

  def install
    bin.install "rhebok"
    prefix.install "LICENSE", "THIRD-PARTY-NOTICES.md"
  end

  def caveats
    <<~EOS
      Finish setting rhebok up. This registers its Claude Code plugin, offers to
      connect your other agents and downloads the embedding model:
        rhebok install

      rhebok needs Ollama running: https://ollama.com
      To update, run rhebok update: it runs brew upgrade rhebok, then rhebok install.
    EOS
  end

  test do
    assert_equal "rhebok #{version}", shell_output("#{bin}/rhebok --version").strip
    assert_path_exists prefix/"LICENSE"
    assert_path_exists prefix/"THIRD-PARTY-NOTICES.md"
  end
end
