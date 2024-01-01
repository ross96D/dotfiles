function fcd
    cd $(find . -type d -print | fzf)
end
