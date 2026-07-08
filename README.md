# Vela Studio Homebrew Tap

Homebrew cask for [Vela Studio](https://vela-studio.org/) — a cross-platform
desktop database client (Postgres, MySQL, MongoDB, Redis).

## Install

```bash
brew tap vela-studio-2026/tap
brew install --cask vela-studio
```

Or in one line:

```bash
brew install --cask vela-studio-2026/tap/vela-studio
```

## First launch (Gatekeeper)

Vela Studio is not yet notarized by Apple. On first launch macOS may say the app
is "damaged" or cannot be opened. Clear the quarantine flag once:

```bash
sudo xattr -rd com.apple.quarantine "/Applications/Vela Studio.app"
```

Then open it normally. Notarization is on the roadmap; this step will go away
once the app is signed with an Apple Developer ID.

## Updating

```bash
brew upgrade --cask vela-studio
```

Vela Studio also self-updates in-app (OTA), so `auto_updates true` is set — Homebrew
will not fight the built-in updater.

## Maintenance

`Casks/vela-studio.rb` is generated automatically on each `v*` release by the
`vela-db` release workflow (`scripts/publish-homebrew-cask.mjs`). Do not edit it
by hand — changes are overwritten on the next release.
