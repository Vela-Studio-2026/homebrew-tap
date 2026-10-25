cask "vela-studio" do
  version "0.6.5"

  on_arm do
    sha256 "552abb455e03502f7fb64cea3fa2544d2c6f545fd4c783d1aa3c0badf9be68f4"
    url "https://updates.vela-studio.org/0.6.5/darwin-aarch64/Vela%20Studio_0.6.5_aarch64.dmg"
  end
  on_intel do
    sha256 "bd71f8d21427f20bb8ce40943476be03f5866454398fe6f502900a23d41cd0d6"
    url "https://updates.vela-studio.org/0.6.5/darwin-x86_64/Vela%20Studio_0.6.5_x64.dmg"
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
