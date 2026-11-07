cask "gitos" do
  version "0.1.6"
  sha256 "d1794e830241cdd734425bf92868778a771a5f6f86a5818b52ba65d731d60d11"

  url "https://github.com/Dhunu/gitOS/releases/download/v#{version}/GitOS-#{version}.dmg"
  name "GitOS"
  desc "Git client that picks the right GitHub account for every repository"
  homepage "https://gitos.angelsaikia.com/"

  livecheck do
    url "https://github.com/Dhunu/gitOS"
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "GitOS.app"

  caveats <<~EOS
    GitOS requires macOS 27 or later on Apple silicon.

    The app is not yet notarized by Apple. If macOS blocks the first launch,
    right-click GitOS in Applications and choose Open, or allow it under
    System Settings › Privacy & Security.
  EOS

  zap trash: [
    "~/Library/Application Support/GitOS",
    "~/Library/Caches/com.angelsaikia.gitos",
    "~/Library/Preferences/com.angelsaikia.gitos.plist",
  ]
end
