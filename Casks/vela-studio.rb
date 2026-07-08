cask "vela-studio" do
  version "0.1.1"

  on_arm do
    sha256 "35eb885243cf3c40efcfbcfd98a7eca0e5c74bc86b0691c887d095a88199139d"
    url "https://updates.vela-studio.org/0.1.1/darwin-aarch64/Vela%20Studio.app.tar.gz"
  end
  on_intel do
    sha256 "fc510fb90ac7bf56dfd82e53d47614d177ae7517c4c1ed7ec5c286e3a8f2bea8"
    url "https://updates.vela-studio.org/0.1.1/darwin-x86_64/Vela%20Studio.app.tar.gz"
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

