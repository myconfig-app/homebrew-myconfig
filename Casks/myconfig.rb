# version·sha256은 Release를 게시하면 .github/workflows/update-casks.yml이 고친다
cask "myconfig" do
  version "0.10.0"
  sha256 "3a3bef82f72b411d117567c805df4af6ae2e064316764598204ca24d65db9b11"

  # 명령줄 도구는 앱 안의 것을 연결한다. 따로 내려받은 단독 실행 파일은 공증 티켓을 붙일 수 없어
  # 격리 속성이 있으면 Gatekeeper가 막지만, 공증된 앱 묶음 안의 것은 앱을 열기 전에도 실행된다.
  # 앱과 같은 버전이 늘 함께 설치된다. 앱 안 CLI는 arm64만 있다
  on_arm do
    binary "#{appdir}/MyConfig.app/Contents/Helpers/myconfig"
  end

  url "https://github.com/myconfig-app/homebrew-myconfig/releases/download/app-v#{version}/MyConfig.dmg"
  name "MyConfig"
  desc "Editor that encrypts only the secret values inside config files"
  homepage "https://myconfig.app/"

  # 앱 Release 태그(app-v…)만 고른다
  livecheck do
    url :url
    regex(/^app-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

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
