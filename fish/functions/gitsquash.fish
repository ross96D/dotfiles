function gitsquash -d "hack to rewrite history in a form of a git merge --squash but without merge"
    # TODO make validation
    set s (git log --format=%B --reverse HEAD~$argv[1]..HEAD)
    $s | string join ...
    git reset --soft HEAD~$argv[1]; and git commit --edit -m (string join \n $s | string collect)
end
