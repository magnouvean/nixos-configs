# Run hyprlock in the background
hyprlock &

# Get PID
LOCK_PID=$!

# Run swayidle to turn off screen after 15s
swayidle -w \
    timeout 15 "$HOME/.config/hypr/turn_off_all_displays.sh" \
    resume "$HOME/.config/hypr/turn_on_all_displays.sh" &

IDLE_PID=$!

# Wait for hyprlock to close
wait $LOCK_PID

# Kill the idle manager
kill $IDLE_PID
