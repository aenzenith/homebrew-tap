cask "pitwall" do
  version "1.18.0"
  sha256 "0b83670af8b8bf0d2dd81921339672453b1c41f82f78b086e7e52e729b39417a"

  url "https://github.com/aenzenith/pitwall/releases/download/v#{version}/Pitwall_#{version}_aarch64.dmg"
  name "Pitwall"
  desc "Run dev servers and see when Claude Code is waiting, from the menu bar"
  homepage "https://pitwall.aenzenith.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Pitwall.app"

  uninstall launchctl: "Pitwall",
            quit:      "com.aenzenith.pitwall"

  zap trash: [
    "~/Library/Application Support/com.aenzenith.pitwall",
    "~/Library/Caches/com.aenzenith.pitwall",
    "~/Library/Preferences/com.aenzenith.pitwall.plist",
    "~/Library/WebKit/com.aenzenith.pitwall",
  ]

  caveats <<~EOS
    Pitwall isn't notarized yet. On macOS 15 and later the first open is blocked:
    open System Settings > Privacy & Security, click Open Anyway within about an
    hour, then enter your password. You only do this once.
  EOS
end
