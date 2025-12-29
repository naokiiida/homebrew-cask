cask "spacewalker" do
  version "1.8.0"
  sha256 "e121eb26b6bf983eea68f9e6b74c51228afdfad17f2db5b5d14348634860c3bd"

  url "https://static.viture.dev/external-file/macOS/SpaceWalker-Installer_v#{version}.dmg",
      verified: "static.viture.dev/external-file/macOS/"
  name "SpaceWalker"
  desc "Use virtual monitors with Viture XR glasses"
  homepage "https://academy.viture.com/xr_glasses/spacewalker_mac"

  livecheck do
    url "https://static.viture.dev/external-file/macos/appstart_macos.txt"
    strategy :json do |json|
      json["macNewVersion"]
    end
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Immersive 3D.app"

  zap trash: [
    "~/Library/Application Support/com.viture.spacewalker",
    "~/Library/Caches/com.viture.spacewalker",
    "~/Library/HTTPStorages/com.viture.spacewalker",
    "~/Library/Preferences/com.viture.spacewalker.plist",
  ]
end
