# version·sha256은 Release를 게시하면 .github/workflows/update-casks.yml이 고친다
cask "myconfig-cli" do
  version "0.7.0"
  sha256 "65c2cbf6d848c0d27269aeec902ea93f6d9f43681b8e72624ffbf3c4c64366f9"

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

  # 앱 cask myconfig와 함께 설치할 수 있다 (앱 cask는 명령을 연결하지 않음)
  depends_on arch: :arm64
  depends_on macos: :ventura

  binary "myconfig"
end
