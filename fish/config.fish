starship init fish | source

begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end
source /usr/share/autojump/autojump.fish


alias c='code --no-proxy-server=true .'
alias fixcolor='nvidia-settings --load-config-only'
alias obsidian='/home/abelardo/apps/Obsidian-1.4.16.AppImage'


pyenv init - | source

set -gx PIPX_DEFAULT_PYTHON "$HOME/.pyenv/versions/3.12.0/bin/python"

bind \ch backward-kill-word
bind \e\[3\;5~ kill-word

# make on_pwd trigger
function __on_pwd -v PWD
    # located at ./conf.d/task.dyncompl.fish
    __task_autocompletions
end
