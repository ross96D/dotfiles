starship init fish | source

begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    else
        source /usr/share/autojump/autojump.fish
    end
end

# set video player variable
set -g __VIDEO_PLAYER vlc

alias c='code --no-proxy-server=true .'
alias fixcolor='nvidia-settings --load-config-only'
alias obsidian='/home/abelardo/apps/Obsidian-1.4.16.AppImage'
alias conssh="kitten ssh abelardo@95.217.186.1"

if type -q pyenv
    pyenv init - | source
    set -gx PIPX_DEFAULT_PYTHON "$HOME/.pyenv/versions/3.12.0/bin/python"
end


bind \ch backward-kill-word
bind \e\[3\;5~ kill-word

# make on_pwd trigger
function __on_pwd -v PWD
    # located at ./conf.d/task.dyncompl.fish
    __task_autocompletions
end
