cask "gitos" do
  version "0.3.1"
  sha256 "7f65d853660fa1d01218047bff6c98fa13c10c16fe0bf6d07e964792044fd635"

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
    GitOS requires macOS 26 or later on Apple silicon.

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
