# aenzenith/tap

Homebrew tap for [Pitwall](https://pitwall.aenzenith.com): it runs your projects' dev servers and
shows when Claude Code is waiting on you, from the menu bar. Source:
[aenzenith/pitwall](https://github.com/aenzenith/pitwall). Not related to other projects named Pitwall.

```sh
brew install --cask aenzenith/tap/pitwall
```

Apple Silicon, macOS 13 or later. Pitwall updates itself, so `brew upgrade` leaves it alone unless you
pass `--greedy`.

Builds aren't notarized yet. On macOS 15 and later the first open is blocked: open System Settings ›
Privacy & Security, click Open Anyway within about an hour, then enter your password.

To remove it, first take out what Pitwall added to Claude Code (Settings › Claude: the hook and the team
radio) and the `pitwall` command (Settings › General), then:

```sh
brew uninstall --cask pitwall          # the app and its login item
brew uninstall --zap --cask pitwall    # also its settings, projects and board
```

`~/.pitwall` is shared with the VS Code extension and is left in place.

The cask follows new releases on its own: `.github/workflows/update.yml` checks every hour.
