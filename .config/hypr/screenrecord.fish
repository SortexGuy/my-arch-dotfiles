#!/usr/bin/fish

function wl-screenrec_check
    if pgrep -x wl-screenrec >/dev/null
        pkill -INT -x wl-screenrec
        dunstify "Stopping all instances of wl-screenrec" (cat /tmp/recording.txt)
        wl-copy <(cat /tmp/recording.txt)
        exit 0
    end
end

wl-screenrec_check

set -g VID $HOME"/Videos/ScreenCap/"(date +%Y-%m-%d_%H-%m-%s)".mp4"

# wf-recorder -a -g (slurp) -f $VID
wl-screenrec -g (slurp) -f $VID
