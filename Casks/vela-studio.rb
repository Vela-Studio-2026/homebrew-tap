cask "vela-studio" do
  version "0.1.8"

  on_arm do
    sha256 "99a941cd1da91956c0f9c87cbdcef1b915a8e46603307b6b89918d4c66a87c34"
    url "https://updates.vela-studio.org/0.1.8/darwin-aarch64/Vela%20Studio_0.1.8_aarch64.dmg"
  end
  on_intel do
    sha256 "70c1497b338452068964c953dfca32c51d9e26d2a5b39f4524d3c803d3c81ce4"
    url "https://updates.vela-studio.org/0.1.8/darwin-x86_64/Vela%20Studio_0.1.8_x64.dmg"
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
