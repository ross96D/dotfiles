function fvid -d "fuzzy find a video and open it"
    eval $__VIDEO_PLAYER (get_videos | fzf)
end


function get_videos
    find . -type f | grep -iE '\.webm$|\.flv$|\.ogv$|\.mng$|\.avi$|\.mov$|\.wmv$|\.yuv$|\.rm$|\.rmvb$|/.asf$|\.amv$|\.mp4$|\.m4v$|\.mkv$|\.svi$|\.3gp$|\.flv$|\.f4v$'
end
