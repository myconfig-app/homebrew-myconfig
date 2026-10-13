# MyConfig Homebrew Tap & Releases

[MyConfig](https://myconfig.app/) encrypts only the secret values inside your config files and notes.
This repository is the Homebrew tap and the download location (GitHub Releases) for the macOS app and CLI.

## Install

```sh
# App (includes the `myconfig` CLI on Apple silicon)
brew install --cask myconfig-app/tap/myconfig

# CLI only (Apple silicon)
brew install --cask myconfig-app/tap/myconfig-cli
```

The two casks both provide the `myconfig` command, so install only one of them.
Without Homebrew, download [`MyConfig.dmg`](https://github.com/myconfig-app/homebrew-tap/releases/latest/download/MyConfig.dmg) from the latest release.
Every file is signed with a Developer ID and notarized by Apple.

## 설치

```sh
# 앱 (Apple silicon에서는 `myconfig` 명령줄 도구도 함께 연결)
brew install --cask myconfig-app/tap/myconfig

# 명령줄 도구만 (Apple silicon)
brew install --cask myconfig-app/tap/myconfig-cli
```

두 cask 모두 `myconfig` 명령을 연결하므로 하나만 설치합니다.
Homebrew 없이 설치하려면 최신 릴리스의 [`MyConfig.dmg`](https://github.com/myconfig-app/homebrew-tap/releases/latest/download/MyConfig.dmg)를 받습니다.
모든 파일은 Developer ID로 서명하고 Apple 공증을 받았습니다.

## Releases

The app and the CLI are released separately, each with its own version.

| Tag | File | Cask |
|---|---|---|
| `app-v<version>` | `MyConfig.dmg`: macOS app (universal), with the CLI inside at `MyConfig.app/Contents/Helpers/myconfig` (arm64) | `myconfig` |
| `cli-v<version>` | `myconfig-cli-macos-arm64.zip`: standalone CLI (arm64) | `myconfig-cli` |

The latest app release is always marked as "Latest", so
`https://github.com/myconfig-app/homebrew-tap/releases/latest/download/MyConfig.dmg` always points to the newest app.
Publishing a release runs `.github/workflows/update-casks.yml`, which updates `version` and `sha256` of the matching cask.
