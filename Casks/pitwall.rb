cask "pitwall" do
  version "1.13.0"
  sha256 "82a497a1b0bf95d8ef604ad649dc574fce605d0f94ffe9b187bb63faada843a7"

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
