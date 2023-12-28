
function __task_autocompletions
    # delete contents to avoid corrupt completions for files without a task file
    set -eg __task_autocompletions_commands

    # get tasks from taskfile if exists
    if test -f Taskfile.yml || test -f Taskfile.yaml || test -f Taskfile.dist.yml || test -f Taskfile.dist.yaml

        set -l matches (task --list-all | string match -gr "\\* (.*):\\s*(.*)")

        # in fish there is no hash table, so i use two arrays to asociate the command with his description
        set -l isKey 0
        for m in $matches
            if test $isKey = 0
                set -fa commands $m
                set isKey 1
            else
                set -fa description $m
                set isKey 0
            end
        end

        # this is used to check if the command is available in the current taskfile
        set -g __task_autocompletions_commands $commands

        for i in (seq (count $commands))
            complete -c task -n "not __fish_seen_subcommand_from $commands && __is_in__task_autocompletions_commands $commands[$i]" -a "$commands[$i]" -d "$description[$i]"
        end
    end
end

function __is_in__task_autocompletions_commands
    if contains -- $argv[1] $__task_autocompletions_commands
        return 0
    end
    return 1
end
