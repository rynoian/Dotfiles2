read -rp "Which WS do you want to go to? " ws
hyprctl dispatch "hl.dsp.focus({ workspace = \"$ws\" })"
sleep 1
exit 0
