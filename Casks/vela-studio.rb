cask "vela-studio" do
  version "0.3.2"

  on_arm do
    sha256 "04c74f4bc7019b3f27f27e94deced5da52fc7f9a8d2019dc446fc0c2b1022e87"
    url "https://updates.vela-studio.org/0.3.2/darwin-aarch64/Vela%20Studio_0.3.2_aarch64.dmg"
  end
  on_intel do
    sha256 "71347d907b558e9e50a4efef75a41e25c9f0581307d697720326c4036fc51c64"
    url "https://updates.vela-studio.org/0.3.2/darwin-x86_64/Vela%20Studio_0.3.2_x64.dmg"
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
