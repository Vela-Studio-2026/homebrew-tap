cask "vela-studio" do
  version "0.1.3"

  on_arm do
    sha256 "cbe4ffdd6813bd5a849f2d933f2fa3c81ac70f55a6c7fc35aad0fc28f0187285"
    url "https://updates.vela-studio.org/0.1.3/darwin-aarch64/Vela%20Studio_0.1.3_aarch64.dmg"
  end
  on_intel do
    sha256 "2b0ddcf2f6e2d667b90d4ca37d769fd9b7f4efc7758058d6e09d1d88c830e926"
    url "https://updates.vela-studio.org/0.1.3/darwin-x86_64/Vela%20Studio_0.1.3_x64.dmg"
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
