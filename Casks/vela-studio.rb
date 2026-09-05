cask "vela-studio" do
  version "0.5.0"

  on_arm do
    sha256 "0c8860912f52362afd7ef143db9e6e302aacf42b129fc72941cad070af2c7785"
    url "https://updates.vela-studio.org/0.5.0/darwin-aarch64/Vela%20Studio_0.5.0_aarch64.dmg"
  end
  on_intel do
    sha256 "36e8852358bc4872ca60d37940014d95204253da242e10c764655f98a3efce22"
    url "https://updates.vela-studio.org/0.5.0/darwin-x86_64/Vela%20Studio_0.5.0_x64.dmg"
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
