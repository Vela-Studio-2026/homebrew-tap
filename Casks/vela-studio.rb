cask "vela-studio" do
  version "0.6.2"

  on_arm do
    sha256 "8eea6acba80e6d60609d46d377328da477f77d00793773f082ce3ccdc8814fdb"
    url "https://updates.vela-studio.org/0.6.2/darwin-aarch64/Vela%20Studio_0.6.2_aarch64.dmg"
  end
  on_intel do
    sha256 "5f81caef73c04bba4464d1d22c624932dd9033aea6908e8f103180258dcfe3d6"
    url "https://updates.vela-studio.org/0.6.2/darwin-x86_64/Vela%20Studio_0.6.2_x64.dmg"
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
