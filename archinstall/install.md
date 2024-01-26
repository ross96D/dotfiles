
# Installation
## 1 Select mirrors
`nano /etc/pacman.d/mirrorlist` comment all and put 
```
Server = http://repos.uo.edu.cu/archlinux/$repo/os/$arch
```

## 2 Use the archinstall script
Just type `archinstall`. Use the lts kernel, dont select any mirrors.

Select awesome. This will install by default alacritty. Later we will change it to kitty

## 3 After installation there are some more steps.
```
sudo pacman -S git fish exa bat python3
```

## 4 Install autojump
Clone the git repository https://github.com/wting/autojump and ./install.py (Maybe is usefull to save the post installation step if the later config files are wrong)


## 5 Install nerdfonts
Go to https://github.com/ryanoasis/nerd-font, on the releases page download the desired font.
To install just decompress the content on the .local/share/fonts folder and run `fc-cache -f`
Suggestions `ComicShannsMono Nerd Font Mono`

## 6 Install emojis
`sudo pacman -S noto-fonts-emoji`

## 7 Install starship
`sudo pacman -S starship`

## 8 Set the configuration
Git clone the https://github.com/ross96D/dotfiles and use the setup script.
```
python3 setup.py
```
Type `python3 setup.py -h` to see the help

# Postinstallation
## Compositor
*If the window manager does not have a compositor follow this.*

Install `picom`. See the man page on the section blur to see how to make it.

*After an stable configuration, set the picom -b to run on start*