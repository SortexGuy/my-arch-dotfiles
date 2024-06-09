#! /usr/bin/fish

set -g imgs ~/bgs/**.{jpg,jpeg,png,webp}
if test $status -ne 0
    set -f st $status
    echo "Bad Glob"
    return $st
end
set -g img_count (count $imgs)

function load_wallpaper
    set -f preload_cmd hyprpaper preload
    set -f wallpaper_cmd hyprpaper wallpaper

    set -f rand_num (random 1 $img_count)
    set -f curr_img $imgs[$rand_num]
    echo $curr_img
    hyprctl $preload_cmd $curr_img
    hyprctl $wallpaper_cmd "eDP-1, $curr_img"
    hyprctl hyprpaper unload all
    dunstify -t 3000 "Changed wallpaper" "to $curr_img"
end

while true
    sleep $(math "60 * 5")

    pgrep hyprpaper >/dev/null
    if test $status -ne 0
        hyprpaper & disown
    end

    load_wallpaper
end
