# Hyprland INFO & TIPS

## General Config

```
nvim .config/hypr/hyprland.conf
hyprctl reload
```

## Waybar

```
nvim ~/.config/waybar/ .
```

[Style Examples](https://github.com/Alexays/Waybar/wiki/Examples)

## Monitors

```
nvim .config/hypr/hyprland.conf
```
```
# See https://wiki.hyprland.org/Configuring/Monitors/
#monitor=,preferred,auto,auto
monitor=HDMI-A-6, 1920x1080, 0x0, 1 # Left
monitor=DP-4, 1920x1080, 1920x0, 1  # Middle
monitor=DP-3, 1920x1080, 3840x0, 1  # Right
```

## Default App Entry

### Nvim example (how to set text/plain apps to nvim)

```
nvim ~/.local/share/applications/nvim-terminal.desktop
```

```
[Desktop Entry]
Name=Neovim (Terminal)
Exec=kitty -e nvim %f
Type=Application
MimeType=text/plain;
```

```
xdg-mime default nvim-terminal.desktop text/plain
```

## Volume

### Test command:

```
amixer set Master 70%,18%
```

### Add conf to hyprland.conf:

```
exec-once = amixer set Master 70%,18%
```
