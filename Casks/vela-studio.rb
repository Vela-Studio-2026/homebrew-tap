cask "vela-studio" do
  version "0.1.7"

  on_arm do
    sha256 "7c10914934c8fec24f4146012cb88a4168db7adf57c1520fbbf1895aa4b219dd"
    url "https://updates.vela-studio.org/0.1.7/darwin-aarch64/Vela%20Studio_0.1.7_aarch64.dmg"
  end
  on_intel do
    sha256 "968cc205677240e9c1f8880f70e3d9d85b7dd7807940ef5c74e1272df78ec987"
    url "https://updates.vela-studio.org/0.1.7/darwin-x86_64/Vela%20Studio_0.1.7_x64.dmg"
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
