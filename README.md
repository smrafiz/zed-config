# zed-config (private)

My Zed setup: JetBrains keymap, Driftwood theme + Archipelago Icons, PhpStorm-style editor features, WebStorm-style TS colours.

## New machine

```sh
git clone <this repo> ~/GithubProjects/zed-config && ~/GithubProjects/zed-config/install.sh
```

Then install the **Archipelago** extension in Zed (store, or `zed: install dev extension` → the archipelago repo) and restart Zed.

`settings.json` and `keymap.json` are symlinked into `~/.config/zed`, so changes made in Zed land here: commit and pull to sync machines.

## Per project

WordPress: `composer require --dev php-stubs/wordpress-stubs`. Open each project as its own folder (`zed <dir>`), not loose files, or Intelephense runs twice and hints double.
