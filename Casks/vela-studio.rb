cask "vela-studio" do
  version "0.1.6"

  on_arm do
    sha256 "70ea6752c555e4feb8db298b1f0f64d19359723972b0ad3e37e352bc79104e8e"
    url "https://updates.vela-studio.org/0.1.6/darwin-aarch64/Vela%20Studio_0.1.6_aarch64.dmg"
  end
  on_intel do
    sha256 "f356e9e090d0f9f9fab9bfa10b24da1e44b542f13c8224aecaa305b4500ce885"
    url "https://updates.vela-studio.org/0.1.6/darwin-x86_64/Vela%20Studio_0.1.6_x64.dmg"
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
