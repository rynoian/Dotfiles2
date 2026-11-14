sleep 0.1 && fastfetch

#Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T"

# alias 
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ping='ping -c 10'
alias cls='clear'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% |xargs -ro yay -S"

# change dir alias
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# remove dir and all files
alias rmd='/bin/rm --recursive --force --verbose'

# Alias's for multiple directory listing commands
alias ll='ls -Fls'
alias lla='ls -Al'

#starship
eval "$(starship init bash)"
