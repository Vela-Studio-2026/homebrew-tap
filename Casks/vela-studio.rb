cask "vela-studio" do
  version "0.1.2"

  on_arm do
    sha256 "7ee34f861d1453b9c21157de33806dd459520b23285d27a6404b6b73d7eae02d"
    url "https://updates.vela-studio.org/0.1.2/darwin-aarch64/Vela%20Studio.app.tar.gz"
  end
  on_intel do
    sha256 "0622058a1f26d22a2f23848cfc8114027fdef12b91a070265d51cf8450540303"
    url "https://updates.vela-studio.org/0.1.2/darwin-x86_64/Vela%20Studio.app.tar.gz"
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

