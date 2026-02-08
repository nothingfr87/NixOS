# NON-OS

NON-OS is my NixOS Configurations

---

# Preview

![Preview](preview.png)

---

# How To Use

- Clone this repo into your home directory

- Copy `/etc/nixos/hardware-configuration.nix` in `~/NixOS/non-os/`

- Rebuild NixOS using flakes (use your host name at the end
    
    ```bash
    sudo nixos-rebuild switch --flake ~/NixOS/non-os#host-name
    ```

    After this rebuild the command we just ran will be aliased into `nrs`

    
## Prerequisites

#### Fonts
- JetBrainsMono Nerd Font

#### DE
- Cinnamon

#### Terminal
- GNOME Terminal

#### Utilities
- btop
- grim
- slurp
- fish (Shell)
