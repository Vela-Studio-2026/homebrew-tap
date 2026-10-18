cask "vela-studio" do
  version "0.6.4"

  on_arm do
    sha256 "5285d64c843709599100d82584de31a57644f1036405010563d124146e2d5754"
    url "https://updates.vela-studio.org/0.6.4/darwin-aarch64/Vela%20Studio_0.6.4_aarch64.dmg"
  end
  on_intel do
    sha256 "4706a9e1700ef899479f2c06d64902eb7d3931a1a1bdfa839333a0c7ca62d11d"
    url "https://updates.vela-studio.org/0.6.4/darwin-x86_64/Vela%20Studio_0.6.4_x64.dmg"
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
