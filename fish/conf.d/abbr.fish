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
