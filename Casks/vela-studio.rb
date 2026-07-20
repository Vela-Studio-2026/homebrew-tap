cask "vela-studio" do
  version "0.1.9"

  on_arm do
    sha256 "025fa1740f609fb05cee83ed0b1f009c7f046721cb501ec935826c467c6ae627"
    url "https://updates.vela-studio.org/0.1.9/darwin-aarch64/Vela%20Studio_0.1.9_aarch64.dmg"
  end
  on_intel do
    sha256 "43e22a745be909a201fbd68c96df0459d92850794bbf6a98bfcf1c2d603323d6"
    url "https://updates.vela-studio.org/0.1.9/darwin-x86_64/Vela%20Studio_0.1.9_x64.dmg"
  end

  name "Vela Studio"
  desc "Cross-platform desktop database client (Postgres, MySQL, MongoDB, Redis)"
  homepage "https://vela-studio.org/"

  livecheck do
    url "https://updates.vela-studio.org/downloads/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "Vela Studio.app"

  caveats <<~EOS
    Vela Studio is not yet notarized by Apple. If macOS reports the app is
    "damaged" or cannot be opened, clear the quarantine flag once:

      sudo xattr -rd com.apple.quarantine "/Applications/Vela Studio.app"
  EOS

  zap trash: [
    "~/Library/Application Support/com.vela.studio",
    "~/Library/Caches/com.vela.studio",
    "~/Library/WebKit/com.vela.studio",
    "~/Library/Saved Application State/com.vela.studio.savedState",
  ]
end
