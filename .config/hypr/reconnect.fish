#! /usr/bin/fish

while true
    if not nmcli device wifi list | grep "\*" >/dev/null
        nmcli device wifi connect 'CRISTO VIVE.'
        dunstify "Wifi reconnected" "Reconnected to 'CRISTO VIVE.'"
    end
    sleep 5
end
