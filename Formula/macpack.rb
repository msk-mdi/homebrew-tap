# Homebrew formula for macpack, in the msk-mdi/homebrew-tap repository as
# Formula/macpack.rb:
#   brew install msk-mdi/tap/macpack
# It installs the release's universal binary (Apple silicon and Intel).
# macpack's release workflow updates url and sha256 for each release.
class Macpack < Formula
  desc "Export macOS settings to a portable profile and apply them on another Mac"
  homepage "https://github.com/msk-mdi/macpack"
  url "https://github.com/msk-mdi/macpack/releases/download/v1.0.0/macpack-v1.0.0-universal-apple-darwin.tar.gz"
  sha256 "a75e408275f7e5179afa33f893c9933f534fb9a136ee9199e956f01886aaf908"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  def install
    bin.install "macpack"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/macpack --version")
    assert_match "dock.autohide", shell_output("#{bin}/macpack list --category Dock")
  end
end
