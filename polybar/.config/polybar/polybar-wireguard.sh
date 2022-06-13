#!/usr/bin/env bash

# Unfortunately it's not easy to directly use Polybar colour values in this
# script so I have to redefine some of my colours here. See the link below for
# more details:
# https://github.com/polybar/polybar/wiki/Formatting#format-tags-inside-polybar-config
green=#71f071

configs_path="$HOME/.config/wireguard"
connected_interface=$(sudo wg | grep interface | cut -d " " -f2)

connect() {
    selected_config=$(ls $configs_path/*.conf | xargs basename -a -s .conf | rofi -dmenu -theme .config/rofi/themes/rounded-blue-dark.rasi)
    [[ $selected_config ]] && sudo wg-quick up "$configs_path"/"$selected_config".conf
}

disconnect() {
    # Normally we should have a single connected interface but technically
    # there's nothing stopping us from having multiple active intgerfaces so
    # let's do this in a loop:
    for connected_config in $(sudo wg | grep interface | cut -d " " -f2)
    do
        sudo wg-quick down $configs_path/"$connected_config".conf
    done
}

toggle() {
    if [[ $connected_interface ]]
    then
        disconnect
    else
        connect
    fi
}

print() {
    if [[ $connected_interface ]]
    then
        echo %{u"$green"}%{+u}%{T4}%{F"$green"}%{T-}%{F-} "$connected_interface"
    else
        echo %{T4}%{T-}
    fi
}

case "$1" in
    --connect)
        connect
        ;;
    --disconnect)
        disconnect
        ;;
    --toggle)
        toggle
        ;;
    *)
        print
        ;;
esac
