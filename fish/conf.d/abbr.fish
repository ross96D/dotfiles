function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

abbr --add S --position command sudo
abbr --add SS --position command "sudo systemctl"

function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

# git
abbr -a g --position command git
abbr -a gs --position command "git status"
abbr -a gp --position command "git push"
abbr -a ga --position command "git add"
abbr -a gc --position command --set-cursor "git commit -m \"%\""
abbr -a gac --position command --set-cursor "git add . && git commit -m \"%\""
abbr -a gaca --position command "git add . && git commit --amend"
#

abbr -a fcd --position command fzf-cd-widget

function __help_abbr
    echo "--help | bat --plain --language=help"
end
abbr -a help --position anywhere --function __help_abbr --regex -h
