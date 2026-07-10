cask "vela-studio" do
  version "0.1.5"

  on_arm do
    sha256 "8693a46da5e874b23d9921d7007251c1aa9e521400d922c888c60a6f4b8ce913"
    url "https://updates.vela-studio.org/0.1.5/darwin-aarch64/Vela%20Studio_0.1.5_aarch64.dmg"
  end
  on_intel do
    sha256 "9b3e68870949fa361025a80d0d0b49e28642d5470c9c83f7e076bee982f52d87"
    url "https://updates.vela-studio.org/0.1.5/darwin-x86_64/Vela%20Studio_0.1.5_x64.dmg"
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
