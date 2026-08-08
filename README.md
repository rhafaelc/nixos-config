# nixos-config

Personal NixOS flake for a laptop running Hyprland (native Lua config) with [noctalia-shell](https://docs.noctalia.dev/v5/) v5 as the bar/launcher/lock/OSD/wallpaper layer. Noctalia also drives color theming across the system — GTK, Qt, Ghostty, and VSCode all pull their colors from Noctalia's generated palette rather than being individually themed.

## Layout

```
flake.nix              inputs + the nixosConfigurations.laptop output
hosts/laptop/           this machine's entry point
  configuration.nix     system config
  home.nix               user config (imports home/*)
  hardware-configuration.nix   generated, machine-specific — regenerate per machine
  variables.nix          username/hostname/email/timezone/locale
nixos/                  system-level modules (Hyprland, GDM, Noctalia's recommended
                         services, Steam)
home/
  core.nix               base home-manager settings (username, stateVersion)
  programs/<app>/         one folder per app (git, vscode, spotify, ...)
  system/                 desktop/session-level modules (hyprland, terminal, shells, themes)
  wallpapers/              wallpaper images, staged to ~/Pictures/Wallpapers
```

Every module — under both `nixos/` and `home/` — is its own folder with a `default.nix`, even single-file ones. That's deliberate: a module never needs renaming/restructuring just because it grows a second file later.

## Fresh machine install

1. Boot a NixOS installer with flakes enabled and clone this repo:
   ```sh
   nix-shell -p git --run 'git clone https://github.com/rhafaelc/nixos-config.git'
   cd nixos-config
   ```
2. Generate hardware config for the new machine and drop it in place:
   ```sh
   sudo nixos-generate-config --show-hardware-config > hosts/laptop/hardware-configuration.nix
   ```
3. Edit `hosts/laptop/variables.nix` for the new machine (username, hostname, email, timezone, locale).
4. Install:
   ```sh
   sudo nixos-rebuild switch --flake .#laptop
   ```

## Updating an existing install

```sh
sudo nixos-rebuild switch --flake .#laptop
```

Pull in newer flake inputs first with `nix flake update` (or `nix flake lock --update-input <name>` for just one).

## Adding things

**A new app (home-manager program):** create `home/programs/<name>/default.nix`, add `./​<name>` to the `imports` list in `home/programs/default.nix`.

**A new desktop/session module** (something that's part of the Hyprland session rather than a standalone app — a new noctalia-adjacent tool, a new terminal, etc.): create `home/system/<name>/default.nix`, add it to the `imports` list in `hosts/laptop/home.nix`.

**A new system-level (NixOS) module:** create `nixos/<name>/default.nix`, add it to the `imports` list in `hosts/laptop/configuration.nix`.

**Hyprland keybinds/rules/animations:** edit the relevant file under `home/system/hyprland/hypr/lua/` (`keybinds.lua`, `animations.lua`, `monitors.lua`, `rules.lua`, ...) rather than one giant config file — each is grouped by concern and wired up via home-manager's `extraLuaFiles`. Shared values (like the mod key) live in `variables.lua` and are pulled in with `require('variables')`.

**Wallpapers:** drop image files into `home/wallpapers/` — they're staged to `~/Pictures/Wallpapers/` automatically, which is the directory Noctalia's wallpaper picker, rotation, and `noctalia msg wallpaper-*` commands all read from. No other wiring needed.

## Theming

Noctalia derives a palette from the active wallpaper (`theme.source = "wallpaper"` in `home/system/hyprland/noctalia/default.nix`) and pushes it out to GTK3/GTK4, Qt, Ghostty, and VSCode via its built-in/community template system. Changing the wallpaper re-themes those apps automatically (`noctalia msg templates-apply` to force it).

## Formatting

```sh
nix fmt
```
