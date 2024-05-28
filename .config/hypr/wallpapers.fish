#! /usr/bin/fish

set -g imgs ~/bgs/**_t.{jpg,jpeg,png,webp}
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
    hyprctl $wallpaper_cmd "eDP-1, contain:$curr_img"
    hyprctl hyprpaper unload all
end

while true
    sleep $(math "1 * 5")

    load_wallpaper
end
