#! /usr/bin/fish

function reconnect
    nmcli device wifi connect 'CRISTO VIVE.' >/tmp/nmcli-connect
    set -l st $status
    if test $st -ne 0
        dunstify "Wifi can\'t reconnect" "$(cat /tmp/nmcli-connect)"
        sleep 3
    else
        dunstify "Wifi reconnected" "Reconnected to 'CRISTO VIVE.'"
    end
end

while true
    ping -c 4 8.8.8.8 >/dev/null
    set -l st $status
    if test $st -ne 0
        reconnect
        sleep 3
    end

    sleep 2
end
