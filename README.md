# Omarchy Cyan Tide

A deep teal Omarchy theme with bright cyan-to-green accents, an original geometric tide wallpaper, and optional day-of-week accent rotation.

![Cyan Tide wallpaper](backgrounds/cyan-tide.jpg)

## Palette

| Role | Color |
| --- | --- |
| Background | `#06181a` |
| Foreground | `#d4fff4` |
| Cyan | `#22d3ee` |
| Turquoise | `#22e6c9` |
| Mint | `#31f59c` |

The theme includes configuration for Alacritty, Ghostty, Kitty, Hyprland, Hyprlock, Waybar, Walker, Mako, SwayOSD, btop, Helix, Neovim, VS Code, Obsidian, Chromium, and other Omarchy-integrated applications.

## Install the theme

On Omarchy:

```bash
omarchy theme install https://github.com/dataforxyz/omarchy-cyan-tide.git
```

Omarchy derives the theme name `cyan-tide` from the repository name and applies it automatically. To apply it again later:

```bash
omarchy theme set "Cyan Tide"
```

## Optional daily accent rotation

The included rotation changes the accent each day while preserving the dark teal base:

| Day | Accent |
| --- | --- |
| Monday | Azure blue |
| Tuesday | Sky cyan |
| Wednesday | Cyan |
| Thursday | Turquoise |
| Friday | Aqua-green |
| Saturday | Mint-green |
| Sunday | Spring green |

After installing the theme, run:

```bash
cd ~/.config/omarchy/themes/cyan-tide
./install-rotation.sh
```

The installer places the script and user units at:

```text
~/.local/bin/cyan-tide-rotate
~/.config/systemd/user/cyan-tide-rotate.service
~/.config/systemd/user/cyan-tide-rotate.timer
```

The installer applies today's accent immediately. The timer also runs shortly after login and at the start of each local day. It is persistent, so a missed run is applied after wake or the next login. Before reapplying the live theme, the script waits briefly for Hyprland, Wayland, and the GPU to settle; this prevents Waybar from restarting too early during resume. Live reapplication preserves the current wallpaper and concurrent runs are locked to prevent file-write races.

Useful commands:

```bash
# Apply today's accent now
cyan-tide-rotate

# Preview a specific day
cyan-tide-rotate monday
cyan-tide-rotate 7

# Inspect the timer
systemctl --user status cyan-tide-rotate.timer
systemctl --user list-timers cyan-tide-rotate.timer

# Remove only the rotation automation
cd ~/.config/omarchy/themes/cyan-tide
./uninstall-rotation.sh
```

Set `CYAN_TIDE_APPLY_DELAY` to override the default eight-second live-apply delay:

```bash
CYAN_TIDE_APPLY_DELAY=12 cyan-tide-rotate
```

## Wallpaper

`artwork/cyan-tide.svg` and the rendered `backgrounds/cyan-tide.jpg` were created specifically for this repository. The JPEG is stripped of EXIF and other personal metadata.

To regenerate it with ImageMagick:

```bash
magick -background none artwork/cyan-tide.svg -resize 3840x2160! -strip -quality 92 backgrounds/cyan-tide.jpg
```

## Privacy and security

A pre-publication scan found no credentials, API tokens, private keys, hostnames, personal filesystem paths, private service URLs, or third-party wallpaper metadata. Systemd uses `%h` and the scripts use `$HOME` so the setup is portable between user accounts.

## License

MIT. See [LICENSE](LICENSE).
