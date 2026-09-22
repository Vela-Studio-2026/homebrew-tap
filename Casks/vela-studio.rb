cask "vela-studio" do
  version "0.6.0"

  on_arm do
    sha256 "8735ea07b6bce73c3e47ab1dddcf8a9352993826507c86cc2778228288995dd1"
    url "https://updates.vela-studio.org/0.6.0/darwin-aarch64/Vela%20Studio_0.6.0_aarch64.dmg"
  end
  on_intel do
    sha256 "b3718b25c9644d6f4bdaf707922e6e232a73f8528cf40027319c517017290ef8"
    url "https://updates.vela-studio.org/0.6.0/darwin-x86_64/Vela%20Studio_0.6.0_x64.dmg"
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
