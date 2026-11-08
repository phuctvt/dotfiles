print_windows() {
    active_id=$(xprop -root _NET_ACTIVE_WINDOW 2>/dev/null | awk '{print $NF}')
    
    # Check if active_id is a valid hex window ID starting with 0x
    if [[ "$active_id" =~ ^0x ]]; then
        int_active=$(( 16#${active_id#0x} ))
    else
        int_active=0
    fi

    window_list=""
    while read -r wid desktop machine title; do
        [ "$desktop" = "-1" ] && continue

        int_wid=$(( 16#${wid#0x} ))

        ob_title=$(xprop -id "$wid" _OB_APP_TITLE 2>/dev/null | awk -F '"' '{print $2}')
        app_name=$(echo "$ob_title" | awk -F ' - ' '{print $NF}')

        if [ "$int_wid" -eq "$int_active" ]; then
            display_title="%{F#F0C674}$app_name%{F-}"
        else
            display_title="$app_name"
        fi

        if [ -n "$window_list" ]; then
            window_list+=" • "
        fi

        window_list+="%{A1:wmctrl -i -a $wid:}$display_title%{A}"
    done < <(wmctrl -l)

    echo "$window_list"
}

print_windows

xprop -root -spy _NET_ACTIVE_WINDOW _NET_CLIENT_LIST 2>/dev/null | while read -r _; do
    print_windows
done