# version·sha256은 Release를 게시하면 .github/workflows/update-casks.yml이 고친다
cask "myconfig" do
  version "0.7.3"
  sha256 "30f35832deafcae21fc19bbbef67c0b69724fbfe9b73d29119e3adcbec0feeeb"

  # 앱은 universal이지만 앱 안 CLI는 arm64만 들어 있어 Intel에서는 연결하지 않는다
  on_arm do
    binary "#{appdir}/MyConfig.app/Contents/Helpers/myconfig"
  end

  url "https://github.com/myconfig-app/homebrew-myconfig/releases/download/app-v#{version}/MyConfig.dmg"
  name "MyConfig"
  desc "Editor that encrypts only the secret values inside config files"
  homepage "https://myconfig.app/"

  # 앱(app-v…)과 CLI(cli-v…) Release가 한 저장소에 섞여 있어 태그 앞부분으로 고른다
  livecheck do
    url :url
    regex(/^app-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  conflicts_with cask: "myconfig-cli"
  depends_on macos: :ventura

  app "MyConfig.app"

  # 다시 만들어지는 것만 지운다. 컨테이너의 Vault(Application Support/…/vaults)와 앱 라이브러리 문서
  # (Documents/Library)는 사용자 데이터라 남긴다: 지우면 그 Vault로 암호화한 값을 영영 풀 수 없다.
  # 완전히 지우려면 앱에서 Vault 백업을 내보낸 뒤 ~/Library/Containers/io.myiam.apps.myconfig를 직접 지운다
  zap trash: [
    "~/Library/Application Scripts/io.myiam.apps.myconfig",
    "~/Library/Application Scripts/TWYGNJ292X.io.myiam.myconfig",
    "~/Library/Containers/io.myiam.apps.myconfig/Data/Library/Preferences/io.myiam.apps.myconfig.plist",
    "~/Library/Containers/io.myiam.apps.myconfig/Data/Library/Saved Application State/io.myiam.apps.myconfig.savedState",
    "~/Library/Group Containers/TWYGNJ292X.io.myiam.myconfig",
  ]
end
