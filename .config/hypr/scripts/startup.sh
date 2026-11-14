read -rp "do you want startup apps? [y/N]" enter
if [ "$enter" != "y" ]; then
  exit 0;
fi

ai=(kitty -e llama-server --models-preset /home/sercharm/.build/LLM/model.ini --sleep-idle-seconds 900)
open=(obsidian superproductivity firefox signal-desktop)

for app in "${open[@]}"; do
    setsid --fork "$app" </dev/null >/dev/null 2>&1
done

setsid --fork "${ai[@]}" </dev/null >/dev/null 2>&1

# ai=(kitty -e llama-server --models-preset /home/sercharm/.build/LLM/model.ini --sleep-idle-seconds 900)
#
# open=("obsidian" "superproductivity" "firefox" "signal-desktop" "$ai") 
# for idx in ${open[@]}; do
#     setsid --fork $idx </dev/null >/dev/null 2>&1
# done
