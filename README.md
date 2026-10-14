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
brew install --cask myconfig
```

This installs the macOS app and, on Apple silicon, the `myconfig` command line tool that comes inside the app.
They always have the same version.
Without Homebrew, download [`MyConfig.dmg`](https://github.com/myconfig-app/homebrew-myconfig/releases/latest/download/MyConfig.dmg) from the latest release.
Every file is signed with a Developer ID and notarized by Apple.

## Upgrade

```bash
brew upgrade --cask myconfig
```

If you installed the old `myconfig-cli` cask, remove it first, then reinstall the app so that `myconfig` comes from the app:

```bash
brew uninstall --cask myconfig-cli
brew reinstall --cask myconfig
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

# 설치 (앱과 명령줄 도구 myconfig)
brew install --cask myconfig

# 업그레이드
brew upgrade --cask myconfig
```

앱과, Apple silicon에서는 앱 안에 든 `myconfig` 명령줄 도구가 함께 설치되고 버전도 늘 같습니다.
예전 `myconfig-cli` cask를 설치했다면 `brew uninstall --cask myconfig-cli` 뒤 `brew reinstall --cask myconfig`를 실행합니다.
"not trusted" 메시지가 나오면 `brew trust --tap myconfig-app/myconfig`를 다시 실행합니다.

## Releases

| Tag | File | Cask |
|---|---|---|
| `app-v<version>` | `MyConfig.dmg`: macOS app (universal) with the `myconfig` command line tool inside (arm64) | `myconfig` |
| `cli-v<version>` | `myconfig-cli-macos-arm64.zip`: older standalone command line tool releases (0.9.0 and before) | none |

The latest app release is always marked as "Latest", so
`https://github.com/myconfig-app/homebrew-myconfig/releases/latest/download/MyConfig.dmg` always points to the newest app.
Publishing a release runs `.github/workflows/update-casks.yml`, which updates `version` and `sha256` of the matching cask.
