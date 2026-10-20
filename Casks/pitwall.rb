cask "pitwall" do
  version "1.12.3"
  sha256 "db15aac323d6a69d5e89d9aa73c21d476b741734a6e5fbda59c63cbe156f413b"

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
