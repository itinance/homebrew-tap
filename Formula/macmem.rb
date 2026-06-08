class Macmem < Formula
  desc "macOS CLI: heaviest apps, swap usage, and browser tabs"
  homepage "https://github.com/itinance/macmem-monitor"
  url "https://github.com/itinance/macmem-monitor/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "cfccee5e3b6fdda73252c2ff5fa5f5016f682bd1baf4a662705db53d98f60ff2"
  license "MIT"

  depends_on :macos

  def install
    # CLI-only build: the package also ships a SwiftUI menubar app, but the
    # formula installs only the `macmem` binary. Scoping to --product keeps the
    # build working with the Command Line Tools alone (no full Xcode required).
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "macmem"
    bin.install ".build/release/macmem"
  end

  test do
    assert_match "TOP APPS", shell_output("#{bin}/macmem --no-tabs --no-swap")
  end
end
