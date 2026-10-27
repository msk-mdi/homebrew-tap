# Homebrew cask for ToWatchDB, in the msk-mdi/homebrew-tap repository as
# Casks/towatchdb.rb:
#   brew install msk-mdi/tap/towatchdb
# It installs the release's ToWatchDB.app.zip into /Applications. ToWatchDB is
# signed ad hoc, not notarized (that takes a paid Apple developer account), so
# the cask clears the quarantine flag the download leaves on the app, and it
# opens without Gatekeeper's prompt.
# For each release, set version and the zip's sha256 (shasum -a 256).
cask "towatchdb" do
  version "2.1.0"
  sha256 "5495c40c718418f52764d4f378c6ac15313229277db364216b264c3b9aa76568"

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

  # The app's own `ToWatchDB --zap` empties its container and signs it out of Dropbox; this removes the rest.
  zap trash: [
    "~/Library/Application Scripts/com.mehdi.towatchdb",
    "~/Library/Application Support/CrashReporter/ToWatchDB_*.plist",
    "~/Library/Caches/com.mehdi.towatchdb",
    "~/Library/Containers/com.mehdi.towatchdb",
    "~/Library/HTTPStorages/com.mehdi.towatchdb",
    "~/Library/Preferences/com.mehdi.towatchdb.plist",
    "~/Library/Saved Application State/com.mehdi.towatchdb.savedState",
  ]
end
