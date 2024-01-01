Follow https://wiki.archlinux.org/title/Installation_guide.
Here will be custom steps.
---

### 2.1 Select mirrors
`nano /etc/pacman.d/mirrorlist` comment all and put 
```
Server = http://repos.uo.edu.cu/archlinux/$repo/os/$arch
```
```
sudo pacman -Syu
```
```
sudo pacman -S arch-install-scripts
```