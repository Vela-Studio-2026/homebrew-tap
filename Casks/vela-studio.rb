cask "vela-studio" do
  version "0.2.0"

  on_arm do
    sha256 "a0e2d6402bfb63936f4517843c23da1443a7969a25660ddb22d00aae22057d15"
    url "https://updates.vela-studio.org/0.2.0/darwin-aarch64/Vela%20Studio_0.2.0_aarch64.dmg"
  end
  on_intel do
    sha256 "1e706048c0a2f0af76ab42baed0baaff3ce8f7900338518210d68f1cbc011cd9"
    url "https://updates.vela-studio.org/0.2.0/darwin-x86_64/Vela%20Studio_0.2.0_x64.dmg"
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
