mkdir -p ~/.local/share/hyprland
hyprctl monitors -j > ~/.local/share/hyprland/last_monitor_config.json

jq -r '.[].name' ~/.local/share/hyprland/last_monitor_config.json | while read -r name; do
    hyprctl keyword monitor "$name, disable"
done
