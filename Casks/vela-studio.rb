cask "vela-studio" do
  version "0.7.1"

  on_arm do
    sha256 "ac804e27b39bad1e877beb7f2ac8001cd6a12a90f0eee2f7f772f5306c943c8c"
    url "https://updates.vela-studio.org/0.7.1/darwin-aarch64/Vela%20Studio_0.7.1_aarch64.dmg"
  end
  on_intel do
    sha256 "1b896c43222344112bc710f02d3065a762c76ed61077582c8d6024117a16db69"
    url "https://updates.vela-studio.org/0.7.1/darwin-x86_64/Vela%20Studio_0.7.1_x64.dmg"
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
