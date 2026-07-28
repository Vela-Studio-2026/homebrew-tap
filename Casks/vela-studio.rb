cask "vela-studio" do
  version "0.2.1"

  on_arm do
    sha256 "6010936b1b81575dca36af1423997070a7755e58c244c5e907673cc4b8d9de84"
    url "https://updates.vela-studio.org/0.2.1/darwin-aarch64/Vela%20Studio_0.2.1_aarch64.dmg"
  end
  on_intel do
    sha256 "c94d3435f1208183d18a0bef528dcf6ed54d30e28b196df5a6e49ddc11354fd7"
    url "https://updates.vela-studio.org/0.2.1/darwin-x86_64/Vela%20Studio_0.2.1_x64.dmg"
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
