# version·sha256은 Release를 게시하면 .github/workflows/update-casks.yml이 고친다
cask "myconfig-cli" do
  version "0.8.1"
  sha256 "d297128f2b12f4121e8073d2e5da820df5f0ccf4aa0d74b1d3f447faedf7cb53"

  url "https://github.com/myconfig-app/homebrew-myconfig/releases/download/cli-v#{version}/myconfig-cli-macos-arm64.zip"
  name "MyConfig CLI"
  desc "Command-line tool for MyConfig encrypted config values"
  homepage "https://myconfig.app/"

  # 앱(app-v…)과 CLI(cli-v…) Release가 한 저장소에 섞여 있어 태그 앞부분으로 고른다
  livecheck do
    url :url
    regex(/^cli-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # 명령줄 도구는 앱과 함께 쓴다(Vault 키는 실행 중인 앱이 승인해 넘겨줌). 앱이 없으면 앱을 먼저 설치한다.
  # 다른 tap의 같은 이름 cask와 헷갈리지 않게 전체 이름으로 적는다
  depends_on arch: :arm64
  depends_on cask: "myconfig-app/myconfig/myconfig"
  depends_on macos: :ventura

  binary "myconfig"
end
