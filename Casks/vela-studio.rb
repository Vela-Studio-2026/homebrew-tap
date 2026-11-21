cask "vela-studio" do
  version "0.7.0"

  on_arm do
    sha256 "db9570da808ccc84d099a21c51a05ee94e299d75b14997f3261126f050dc3a13"
    url "https://updates.vela-studio.org/0.7.0/darwin-aarch64/Vela%20Studio_0.7.0_aarch64.dmg"
  end
  on_intel do
    sha256 "1aa781bbe5b65f1c51ff0bfe3c746ff1cabd76b90b6d9ef842e333d93d239b70"
    url "https://updates.vela-studio.org/0.7.0/darwin-x86_64/Vela%20Studio_0.7.0_x64.dmg"
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
