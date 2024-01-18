function gitlines -d "count the amount of lines written by each author on the repository"
    # git ls-files -z | grep -zav -E "\.g.dart\$" | grep -zav -E "\.freezed.dart\$" | xargs -0n1 git blame -w --line-porcelain | perl -n -e '/^author (.+)$/ && print "$1\n"' | sort -f | uniq -c | sort -nr
    eval (__construct_filters $argv)
end

function __construct_filters
    set -l command ""
    for arg in $argv
        if test -z "$command"
            set -a command "git ls-files -z "
            set -a command "| grep -zav -E \"$arg\""
        else
            set command "$command | grep -zav -E \"$arg\""
        end
    end
    if test -z "$command"
        set -a command "git ls-files -z "
    end
    set command "$command | mxargs git blame -w --line-porcelain | perl -n -e '/^author (.+)\$/ && print \"\$1\n\"' | sort -f | uniq -c | sort -nr"
    echo "$command"
end
