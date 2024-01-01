function fcd -d "fuzzy find a directory and cd into it"
    cd $(find . -type d -print | fzf)
end
