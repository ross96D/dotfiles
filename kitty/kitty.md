### install kitty
`curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin`

and jsut put symlink to the /usr/bin/ folder to get a system wide installation

`ln -s ~/.local/kitty.app/bin/kitty /usr/bin/` 

install `kitty-terminfo` package to make the kitty terminfo files available system-wide. If not the terminal may present issues with some commands run as sudo. See https://sw.kovidgoyal.net/kitty/faq/#i-get-errors-about-the-terminal-being-unknown-or-opening-the-terminal-failing-or-functional-keys-like-arrow-keys-don-t-work


### keyboard custom key to launch the terminal
add this to a custom keyboard to launch the terminal with fish

`kitty --start-as=maximized sh -c "neofetch; exec fish"`

### themes
clone the themes repo

`git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes`

go into the kitty config folder

`cd ~/.config/kitty`

symlink the theme you want

`ln -s ./kitty-themes/themes/<THEME>.conf ~/.config/kitty/theme.conf`

on the **kitty.conf** file set this `include ./theme.conf`

### fonts
Just change the **kitty.conf** file.

`font_family      FiraCode Nerd Font Mono Med`

`bold_font        FiraCode Nerd Font Mono Bold`

`font_size 12.0`

### kitty icon
download the kitty icons

https://github.com/igrmk/whiskers/raw/main/whiskers_128x128.png 

https://github.com/igrmk/whiskers/raw/main/whiskers_32x32.png 

copy the icons to `~/.local/kitty.app/lib/kitty/logo/` (this directory could vary if u installed with a package manager. Search in `/usr/lib/kitty/logo`)

backup the current icon `mv kitty.png kitty.png.old`

`mv whiskers_32x32.png kitty.png`

`mv whiskers_128x128.png kitty-128.png`

### key shortcuts

This shortcut is to override the default behavior of kitty `ctrl+shift+enter` that launch bash instead of fish

`map ctrl+shift+enter launch sh -c "exec fish"`

