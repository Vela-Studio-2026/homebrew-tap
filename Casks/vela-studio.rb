cask "vela-studio" do
  version "0.6.1"

  on_arm do
    sha256 "4b7b0c7bbca477369fb1eba8c98da44119d2233e7df83aa6ff0e554792437e80"
    url "https://updates.vela-studio.org/0.6.1/darwin-aarch64/Vela%20Studio_0.6.1_aarch64.dmg"
  end
  on_intel do
    sha256 "817696c8f5ecbdf5f0f78aaa34d4e00859d354741f0648498c616d1419f704d5"
    url "https://updates.vela-studio.org/0.6.1/darwin-x86_64/Vela%20Studio_0.6.1_x64.dmg"
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
