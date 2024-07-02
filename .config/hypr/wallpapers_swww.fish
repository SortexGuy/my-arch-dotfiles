#! /usr/bin/fish

set -g imgs ~/Dev/bgs/**.{jpg,jpeg,png,webp}
set -f st $status
if test $st -ne 0
    echo "Bad Glob"
    return $st
end

set -g transition --transition-fps=60 --transition-angle=35 \
    --transition-duration=2 -t=wipe -f=CatmullRom

while true
    pgrep swww-daemon >/dev/null
    set -f st $status
    if test $st -ne 0
        swww-daemon --format xrgb & disown
        sleep 5s
    end

    set -f curr_img (random choice $imgs)
    swww img $transition $curr_img
    sleep 2m
    swww clear-cache
end
