#! /usr/bin/fish

set -g imgs ~/Dev/bgs/**.{jpg,jpeg,png,webp}
set -f st $status
if test $st -ne 0
    echo "Bad Glob"
    return $st
end

while true
    sleep 5m

    load_wallpaper $imgs
end
