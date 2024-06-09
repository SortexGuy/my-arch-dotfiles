function load_wallpaper # argv = imgs
    pgrep hyprpaper >/dev/null
    set -f st $status
    if test $st -ne 0
        hyprpaper & disown
    end

    set -f preload_cmd hyprpaper preload
    set -f wallpaper_cmd hyprpaper wallpaper

    set -f curr_img (random choice $argv)

    hyprctl $preload_cmd $curr_img
    pgrep hyprpaper >/dev/null
    set -f st $status
    if test $st -ne 0
        hyprpaper & disown
        hyprctl $preload_cmd $curr_img
    end

    hyprctl $wallpaper_cmd "DP-1, $curr_img"
    pgrep hyprpaper >/dev/null
    set -f st $status
    if test $st -ne 0
        hyprpaper & disown
        hyprctl $preload_cmd $curr_img
        hyprctl $wallpaper_cmd "DP-1, $curr_img"
    end

    sleep 1
    hyprctl $wallpaper_cmd "HDMI-A-1, $curr_img"
    pgrep hyprpaper >/dev/null
    set -f st $status
    if test $st -ne 0
        hyprpaper & disown
        hyprctl $preload_cmd $curr_img
        hyprctl $wallpaper_cmd "DP-1, $curr_img"
        sleep 1
        hyprctl $wallpaper_cmd "HDMI-A-1, $curr_img"
    end

    hyprctl hyprpaper unload all
    dunstify -t 3000 "Wallpaper changed" "to $curr_img"
end
