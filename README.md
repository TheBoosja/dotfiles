# Boosja's Dotfiles Setup Guide

### i3 Window Manager

- `sudo apt update`
- `sudo apt install i3`
- Log out
- Click on the gear icon and select i3
- Log in
- Generate config file
- Choose the win button as the mod key

### Rxvt (terminal)

- `sudo apt install rxvt-unicode`

### Screen brightness

- `sudo apt install xbacklight`
- Edit /etc/X11/xorg.conf.d/20-intel.conf:
    ```
    Section 'Device'
      Identifier  "Intel Graphics"
      Driver      "intel"
      Option      "Backlight"   "intel_backlight"
    EndSection
    ```
