if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting

if test -f ~/.cache/wal/sequences
    cat ~/.cache/wal/sequences
end

function textupload
    if string length -q $argv[1]
        set FILE_TO_UPLOAD $argv[1]
    else
        set FILE_TO_UPLOAD (echo '-')
    end
    curl -F"file=@$FILE_TO_UPLOAD" 0x0.st
end

function wallpaper
    if string length -q "$argv[1]"
        if test -e "$argv[1]"
            hyprctl hyprpaper preload "$argv[1]"
            hyprctl hyprpaper wallpaper "eDP-1,$argv[1]"
            wal -n -t -i "$argv[1]"
        else if test -e "./$argv[1]"
            hyprctl hyprpaper preload "./$argv[1]"
            hyprctl hyprpaper wallpaper "eDP-1,./$argv[1]"
            wal -n -t -i "$argv[1]"
        else
            echo "Specified wallpaper does not exist."
        end
    else
        echo "Specify a wallpaper path."
    end
end
