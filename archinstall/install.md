
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
Follow the instructions here https://github.com/ryanoasis/nerd-fonts#option-3-install-script

**TLDR** Clone the repo https://github.com/ryanoasis/nerd-fonts and `./install.sh <font>`

## 6 Install starship
`sudo pacman -S starship`

## 7 Set the configuration
Git clone the https://github.com/ross96D/dotfiles and use the setup script. **(TODO)**