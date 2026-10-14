# Homebrew cask for ToWatchDB, in the msk-mdi/homebrew-tap repository as
# Casks/towatchdb.rb:
#   brew install msk-mdi/tap/towatchdb
# It installs the release's ToWatchDB.app.zip into /Applications. ToWatchDB is
# signed ad hoc, not notarized (that takes a paid Apple developer account), so
# the cask clears the quarantine flag the download leaves on the app, and it
# opens without Gatekeeper's prompt.
# For each release, set version and the zip's sha256 (shasum -a 256).
cask "towatchdb" do
  version "2.0.0"
  sha256 "1af96dc3875d1b9dbf47860f146670542de54f1a3b43ccc0b51e90413bf4b7aa"

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
