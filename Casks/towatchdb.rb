# Homebrew cask for ToWatchDB, in the msk-mdi/homebrew-tap repository as
# Casks/towatchdb.rb:
#   brew install msk-mdi/tap/towatchdb
# It installs the release's ToWatchDB.app.zip into /Applications. ToWatchDB is
# signed ad hoc, not notarized (that takes a paid Apple developer account), so
# the cask clears the quarantine flag the download leaves on the app, and it
# opens without Gatekeeper's prompt.
# For each release, set version and the zip's sha256 (shasum -a 256).
cask "towatchdb" do
  version "2.0.1"
  sha256 "991dbbe225d7a49176050ea92b9fc52ee069348826acbac08d23f12873cb1412"

  url "https://github.com/msk-mdi/ToWatchDB/releases/download/MacOS-#{version}/ToWatchDB.app.zip"
  name "ToWatchDB"
  desc "Track the movies and shows you watch"
  homepage "https://github.com/msk-mdi/ToWatchDB"

  livecheck do
    url :url
    regex(/^MacOS[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :sequoia

  app "ToWatchDB.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/ToWatchDB.app"],
                          writable_paths: ["ToWatchDB.app"], writable_base: :appdir
  end

  zap trash: "~/Library/Containers/com.mehdi.towatchdb"
end
