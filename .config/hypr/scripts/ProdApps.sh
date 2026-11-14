# is_int() { [[ "$1" =~ ^-?[0-9]+$ ]]; }
# apps=("obsidian" "superproductivity")
# open=()
#
# for i in "${!apps[@]}"; do
#   echo "$i" "${apps[$i]}"
# done
# str=99
# echo ProdApps.sh running
# while true; do
#   read -rp "Enter num. if done enter done: " str
#   if is_int "$str"; then
#     num=$((str))
#     open+=("$num")
#   else
#     echo -e "\n\n\n-----------------\n opening \n ------------------------"
#     break 
#   fi
# done
# for i in "${open[@]}"; do
#   app="${apps[$i]}"
#   echo "$i" opening "$app"
#   setsid -f "$app" >/dev/null 2>&1 < /dev/null
#   echo "$app" opened
#   echo =========================
# done
# echo CLOSING

#!/usr/bin/env bash

is_int() { [[ "$1" =~ ^-?[0-9]+$ ]]; }

apps=("obsidian" "superproductivity")
open=()

echo "ProdApps.sh running"
for i in "${!apps[@]}"; do
    echo "$i" "${apps[$i]}"
done

while true; do
    read -rp "Enter num. if done enter done: " str
    if is_int "$str"; then
        open+=("$str")
    else
        echo -e "\n\n\n-----------------\n opening \n ------------------------"
        break
    fi
done

for idx in "${open[@]}"; do
    if (( idx < 0 || idx >= ${#apps[@]} )); then
        echo "Invalid index: $idx" >&2
        continue
    fi
    bin=${apps[$idx]}
    if ! command -v "$bin" >/dev/null 2>&1; then
        echo "Not found in PATH: $bin" >&2
        continue
    fi
    setsid --fork "$bin" </dev/null >/dev/null 2>&1
done
