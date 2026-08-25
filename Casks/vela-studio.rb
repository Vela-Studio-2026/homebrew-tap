cask "vela-studio" do
  version "0.4.0"

  on_arm do
    sha256 "3e347ad3675cd770a5b345976f0d89001711fd91d9d3d2439957302fa441f97a"
    url "https://updates.vela-studio.org/0.4.0/darwin-aarch64/Vela%20Studio_0.4.0_aarch64.dmg"
  end
  on_intel do
    sha256 "f8e0b9b619e7e9defd4a6326592482ee8f81d429e60ec9932662ea19fc0d7125"
    url "https://updates.vela-studio.org/0.4.0/darwin-x86_64/Vela%20Studio_0.4.0_x64.dmg"
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
