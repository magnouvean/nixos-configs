jq -c '.[]' ~/.local/share/hyprland/last_monitor_config.json | while read -r monitor; do
    name=$(echo "$monitor" | jq -r '.name')
    res_w=$(echo "$monitor" | jq -r '.width')
    res_h=$(echo "$monitor" | jq -r '.height')
    refresh=$(echo "$monitor" | jq -r '.refreshRate')
    pos_x=$(echo "$monitor" | jq -r '.x')
    pos_y=$(echo "$monitor" | jq -r '.y')
    scale=$(echo "$monitor" | jq -r '.scale')

    hyprctl keyword monitor "$name, ${res_w}x${res_h}@${refresh}, ${pos_x}x${pos_y}, ${scale}"
done
