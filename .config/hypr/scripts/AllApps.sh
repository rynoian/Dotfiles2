files=(~/.config/hypr/scripts/*)
open=()

is_int() { [[ "$1" =~ ^-?[0-9]+$ ]]; }


echo ${files[@]}
for ((i = 0; i < ${#files[@]}; i++)); do
  echo "$i ${files[$i]}"
done

while true; do
  read -rp "Enter num. if done enter done: " str
  if is_int "$str"; then
    num=$((str))
    open+=("$num")
  else
    echo -e "\n\n\n-----------------\n opening \n ------------------------"
    break 
  fi
done


for i in "${open[@]}"; do
  script="${files[$i]}"
  echo ". $script"
  echo "$i" opening "$script"
  kitty "$script"
  echo "$script" opened
  sleep 1
  echo =========================
done
echo CLOSING
sleep 3
