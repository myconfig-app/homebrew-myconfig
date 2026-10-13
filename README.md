# homebrew-myconfig

MyConfig Homebrew Tap: the [MyConfig](https://myconfig.app/) macOS app and the `myconfig` command line tool.
MyConfig encrypts only the secret values inside your config files and notes.
This repository also hosts the release files (GitHub Releases).

## Setup

```bash
brew tap myconfig-app/myconfig
brew trust --tap myconfig-app/myconfig
```

## Install

```bash
# macOS app
brew install --cask myconfig

# Command line tool (Apple silicon)
brew install --cask myconfig-cli
```

Install either one, or both. The app and the command line tool are released and upgraded separately.
Without Homebrew, download [`MyConfig.dmg`](https://github.com/myconfig-app/homebrew-myconfig/releases/latest/download/MyConfig.dmg) from the latest release.
Every file is signed with a Developer ID and notarized by Apple.

## Upgrade

```bash
brew upgrade --cask myconfig
brew upgrade --cask myconfig-cli
```

## Troubleshooting

If you see a message that the tap is not trusted, trust it again:

```bash
brew trust --tap myconfig-app/myconfig
```

## 한국어

```bash
# 처음 한 번
brew tap myconfig-app/myconfig
brew trust --tap myconfig-app/myconfig

# 앱
brew install --cask myconfig

# 명령줄 도구 (Apple silicon)
brew install --cask myconfig-cli
```

하나만 설치해도 되고 둘 다 설치해도 됩니다. 앱과 명령줄 도구는 따로 릴리스하고 따로 업그레이드합니다.
"not trusted" 메시지가 나오면 `brew trust --tap myconfig-app/myconfig`를 다시 실행합니다.

## Releases

The app and the CLI are released separately, each with its own version.

| Tag | File | Cask |
|---|---|---|
| `app-v<version>` | `MyConfig.dmg`: macOS app (universal) | `myconfig` |
| `cli-v<version>` | `myconfig-cli-macos-arm64.zip`: standalone CLI (arm64) | `myconfig-cli` |

The latest app release is always marked as "Latest", so
`https://github.com/myconfig-app/homebrew-myconfig/releases/latest/download/MyConfig.dmg` always points to the newest app.
Publishing a release runs `.github/workflows/update-casks.yml`, which updates `version` and `sha256` of the matching cask.
