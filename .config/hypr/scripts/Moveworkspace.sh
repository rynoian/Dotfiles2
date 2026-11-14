read -rp "which WS you wanna go?" ws
sleep 2
hyprctl dispatch "hl.dsp.window.move({ workspace = \"$ws\" })"
exit 0
