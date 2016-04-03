# Fonts in Arch Linux

The script requires you to enable arch linux multilib repo in `/etc/pacman.conf`

The following repo's need to be added to `/etc/pacman.conf`

``` bash
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch

[infinality-bundle]
SigLevel = Never
Server = http://bohoomil.com/repo/$arch

[infinality-bundle-multilib]
SigLevel = Never
Server = http://bohoomil.com/repo/multilib/$arch

[infinality-bundle-fonts]
SigLevel = Never
Server = http://bohoomil.com/repo/fonts
```
