cask "vela-studio" do
  version "0.6.3"

  on_arm do
    sha256 "d49d839dfcced2b7a52f5b00281111686e3f8f2b78351c0022b56a3004f6a0cc"
    url "https://updates.vela-studio.org/0.6.3/darwin-aarch64/Vela%20Studio_0.6.3_aarch64.dmg"
  end
  on_intel do
    sha256 "923a29bf7f98ce591c04bf974bf74be784bd7573dfefc6bc9d90182b719c7399"
    url "https://updates.vela-studio.org/0.6.3/darwin-x86_64/Vela%20Studio_0.6.3_x64.dmg"
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
