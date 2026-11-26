cask "pitwall" do
  version "1.27.1"
  sha256 "2e279c1f302367c41f1b5c319f4ab55e288dc84fafa73365417e995ff04ca64b"

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
end
