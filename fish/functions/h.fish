function h -d "beautify the help output"
    begin
        __help_command_raw $argv &| read -lz $err &>/dev/null
    end | read -lz $out &>/dev/null

    if test -z "$err" -a -z "$out"
        __help_command $argv
        return
    end

    if test -z "$err"
        __help_command $argv
        return
    else
        __help_flag $argv
        return
    end
end

function __help_flag
    $argv --help 2>&1 | bat --plain --language=help
end

function __help_command
    begin
        __help_command_raw $argv
    end 2>&1 | bat --plain --language=help
end

function __help_command_raw
    set -l _count (count $argv)
    if test $_count -gt 2
        $argv[1..-2] help $argv[-1]
    else
        $argv[1] help $argv[2]
    end
end
