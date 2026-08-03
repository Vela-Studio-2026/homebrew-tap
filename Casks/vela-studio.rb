cask "vela-studio" do
  version "0.3.0"

  on_arm do
    sha256 "74b6a77c7dc4aba8911c7b0cd919e491a9b03621ca8ecb5f4a190de4ea28c6e0"
    url "https://updates.vela-studio.org/0.3.0/darwin-aarch64/Vela%20Studio_0.3.0_aarch64.dmg"
  end
  on_intel do
    sha256 "c1152f1779bc11c54b631086a9892cd169a0fa3bb8c413d6e2fd7e3a07907d0f"
    url "https://updates.vela-studio.org/0.3.0/darwin-x86_64/Vela%20Studio_0.3.0_x64.dmg"
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
