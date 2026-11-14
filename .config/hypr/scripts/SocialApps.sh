apps=("signal-desktop" "discord")
count=0
for i in "${!apps[@]}"; do
  echo "$i" "${apps[$i]}"
  count=$((count+1))
done


read -rp "Enter num: " num

setsid -f "${apps[$num]}" >/dev/null 2>&1 < /dev/null
echo app opened

!/usr/bin/env bash

