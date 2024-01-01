function __task_flag_completions
    complete -c task -f
    complete -c task -s c -l color -d "Colored output. Enabled by default. Set flag to false or use NO_COLOR=1 to disable."
    complete -c task -s C -l concurrency -d "Limit number tasks to run concurrently. Zero means unlimited."
    complete -c task -s d -l dir -d "Sets directory of execution."
    complete -c task -s n -l dry -d "Compiles and prints tasks in the order that they would be run, without executing them."
    complete -c task -s x -l exit-code -d "Pass-through the exit code of the task command."
    complete -c task -s f -l force -d "Forces execution even when the task is up-to-date."
    complete -c task -s g -l global -d "Runs global Taskfile, from $HOME/Taskfile.{yml,yaml}."
    complete -c task -s h -l help -d "Shows Task usage."
    complete -c task -s i -l init -d "Creates a new Taskfile.yml in the current folder."
    complete -c task -s I -l interval -d "Sets a different watch interval when using --watch, the default being 5 seconds. This string should be a valid Go Duration."
    complete -c task -s l -l list -d "Lists tasks with description of current Taskfile."
    complete -c task -s a -l list-all -d "Lists tasks with or without a description."

    complete -c task -l sort -d "Changes the order of the tasks when listed.
default - Alphanumeric with root tasks first
alphanumeric - Alphanumeric
none - No sorting (As they appear in the Taskfile)"

    set -l sortcommands "default alphanumeric none"
    complete -c task -n "not __fish_seen_subcommand_from $sortcommands && __fish_seen_argument -l sort" -a $sortcommands

    complete -c task -l json -d "See JSON Output"
    complete -c task -s o -l output -d "Sets output style: [interleaved/group/prefixed]."

    set -l outputcommands "interleaved group prefixed"
    complete -c task -n "not __fish_seen_subcommand_from $outputcommands && __fish_seen_argument -l output -s o" -a $outputcommands


    complete -c task -l output-group-begin -d "Message template to print before a task's grouped output."
    complete -c task -l output-group-end -d "Message template to print after a task's grouped output."
    complete -c task -l output-group-error-only -d "Swallow command output on zero exit code."
    complete -c task -s p -l parallel -d "Executes tasks provided on command line in parallel."
    complete -c task -s s -l silent -d "Disables echoing."
    complete -c task -s y -l yes -d "Assume `yes` as answer to all prompts."
    complete -c task -l status -d "Exits with non-zero exit code if any of the given tasks is not up-to-date."
    complete -c task -l summary -d "Show summary about a task."
    complete -c task -s t -l taskfile
    complete -c task -s v -l verbose -d "Enables verbose mode."
    complete -c task -l version -d "Show Task version."
    complete -c task -s w -l watch -d "Enables watch of the given task."
end

if tyep -q task
    __task_flag_completions
end
