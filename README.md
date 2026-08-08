# nixos-config

Personal NixOS flake: Hyprland (native Lua config) + [noctalia-shell](https://docs.noctalia.dev/v5/) v5 as the bar/launcher/lock/OSD/wallpaper layer, all wired through home-manager.

## Layout

- `flake.nix` — inputs and the single `nixosConfigurations.default` output.
- `hosts/default/` — this machine's entry point: `configuration.nix` (system), `home.nix` (user), `hardware-configuration.nix` (generated, machine-specific), `variables.nix` (username/hostname/email/timezone/locale).
- `modules/nixos/` — system-level modules (Hyprland, GDM, Noctalia's recommended services, Steam).
- `modules/home-manager/` — user-level modules, one directory per concern (`hyprland/`, `terminal/`, `shells/`, `themes/`, `programs/<app>/`, ...).

## Fresh machine install

1. Boot a NixOS installer with flakes enabled and clone this repo:
   ```sh
   nix-shell -p git --run 'git clone https://github.com/rhafaelc/nixos-config.git'
   cd nixos-config
   ```
2. Generate hardware config for the new machine and drop it in place:
   ```sh
   sudo nixos-generate-config --show-hardware-config > hosts/default/hardware-configuration.nix
   ```
3. Edit `hosts/default/variables.nix` for the new machine (username, hostname, email, timezone, locale).
4. Install:
   ```sh
   sudo nixos-rebuild switch --flake .#default
   ```

## Updating an existing install

```sh
sudo nixos-rebuild switch --flake .#default
```

Pull in newer flake inputs first with `nix flake update` (or `nix flake lock --update-input <name>` for just one).

## Adding wallpapers

Drop image files into `modules/home-manager/wallpapers/` — they're staged to `~/Pictures/Wallpapers/` automatically, which is the directory Noctalia's wallpaper picker, rotation, and `noctalia msg wallpaper-*` commands all read from. No other wiring needed.

## Theming

Noctalia is the single source of truth for color theming: it derives a palette from the active wallpaper (`theme.source = "wallpaper"` in `modules/home-manager/hyprland/noctalia/default.nix`) and pushes it out to GTK3/GTK4, Qt, and Ghostty via its built-in template system. Changing the wallpaper re-themes those apps automatically (`noctalia msg templates-apply` to force it).

## Formatting

```sh
nix fmt
```
