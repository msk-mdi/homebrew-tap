# Homebrew formula for macpack, in the msk-mdi/homebrew-tap repository as
# Formula/macpack.rb:
#   brew install msk-mdi/tap/macpack
# It installs the release's universal binary (Apple silicon and Intel).
# macpack's release workflow updates url and sha256 for each release.
class Macpack < Formula
  desc "Export macOS settings to a portable profile and apply them on another Mac"
  homepage "https://github.com/msk-mdi/macpack"
  url "https://github.com/msk-mdi/macpack/releases/download/v1.1.0/macpack-v1.1.0-universal-apple-darwin.tar.gz"
  sha256 "1dc1eecd89f03e7a27907e3974f414a4da4676be3555a19c1e5ecd912a6aac07"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  def install
    bin.install "macpack"
    generate_completions_from_executable(bin/"macpack", "completions")
    (man1/"macpack.1").write Utils.safe_popen_read(bin/"macpack", "man")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/macpack --version")
    assert_match "dock.autohide", shell_output("#{bin}/macpack list --category Dock")
  end
end
