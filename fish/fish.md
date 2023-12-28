### install fish
Add the repository of fish to get the latest release.. ubuntu repositories are archaic
``` shell
sudo add-apt-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish
```
Or build it from source if possible (maybe after they port all fish to rust..) following this instructions https://github.com/fish-shell/fish-shell/#building

### add completions
get completions from <BINARY_NAME> and paste them to ~/.config/fish/completions/<BINARY_NAME>.fish