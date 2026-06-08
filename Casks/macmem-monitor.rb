cask "macmem-monitor" do
  version "0.2.0"
  sha256 "065136b39b3659a4d83a3266b48fe4ae8766c1b6dd79992b9f0e2118e6dc1fcd"

  url "https://github.com/itinance/macmem-monitor/releases/download/app-v#{version}/MacMem.app.zip",
      verified: "github.com/itinance/macmem-monitor/"
  name "MacMem"
  desc "Honest macOS memory monitor in your menu bar"
  homepage "https://github.com/itinance/macmem-monitor"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "MacMem.app"

  caveats <<~EOS
    MacMem.app is ad-hoc signed, not notarized. The first time you launch it,
    Gatekeeper will block it. Clear the quarantine flag once:

      xattr -dr com.apple.quarantine "#{appdir}/MacMem.app"

    then open it normally. It runs as a menu-bar agent (no Dock icon).
  EOS

  zap trash: [
    "~/Library/Preferences/com.itinance.macmem.menubar.plist",
  ]
end
