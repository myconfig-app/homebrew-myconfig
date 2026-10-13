# version·sha256은 Release를 게시하면 .github/workflows/update-casks.yml이 고친다
cask "myconfig-cli" do
  version "0.7.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/myconfig-app/homebrew-tap/releases/download/cli-v#{version}/myconfig-cli-macos-arm64.zip"
  name "MyConfig CLI"
  desc "Command-line tool for MyConfig encrypted config values"
  homepage "https://myconfig.app/"

  # 앱(app-v…)과 CLI(cli-v…) Release가 한 저장소에 섞여 있어 태그 앞부분으로 고른다
  livecheck do
    url :url
    regex(/^cli-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  # 앱 cask도 같은 이름(myconfig)을 PATH에 연결한다. 앱이 있으면 앱 안 CLI를 쓴다
  conflicts_with cask: "myconfig"
  depends_on arch: :arm64
  depends_on macos: :ventura

  binary "myconfig"
end
