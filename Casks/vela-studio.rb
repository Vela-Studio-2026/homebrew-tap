cask "vela-studio" do
  version "0.3.1"

  on_arm do
    sha256 "8d1905880df10e0db136995894ad94b06dae2d49baa3423653552845ccfb93d4"
    url "https://updates.vela-studio.org/0.3.1/darwin-aarch64/Vela%20Studio_0.3.1_aarch64.dmg"
  end
  on_intel do
    sha256 "0e66b45f45b55d0a11dc2c1cdc1bf992d53dafa81c5f662aa099c35b57c4be8c"
    url "https://updates.vela-studio.org/0.3.1/darwin-x86_64/Vela%20Studio_0.3.1_x64.dmg"
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
