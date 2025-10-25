#! /usr/bin/fish

set -g imgs ~/bgs/**.{jpg,jpeg,png,webp}
if test $status -ne 0
    set -f st $status
    echo "Bad Glob"
    return $st
end

function load_wallpaper
    set -f preload_cmd hyprpaper preload
    set -f wallpaper_cmd hyprpaper wallpaper

    set -f curr_img (random choice $imgs)
    hyprctl $preload_cmd $curr_img
    hyprctl $wallpaper_cmd "eDP-1, $curr_img"
    sleep 2
    hyprctl hyprpaper unload all
end

while true
    pgrep hyprpaper >/dev/null
    if test $status -ne 0
        hyprpaper & disown
        sleep 2
    end

    load_wallpaper

    sleep 2m
end
