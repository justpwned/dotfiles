# if [[ $XDG_SESSION_TYPE == "x11" ]] then
# 	xinput --set-prop "pointer:Logitech MX Master 3" "libinput High Resolution Wheel Scroll Enabled" 0
# 	xinput --set-prop "pointer:Logitech MX Master 3" "libinput Accel Profile Enabled" 0, 1
# 	xinput --set-prop "pointer:Logitech MX Master 3" "libinput Accel Speed" 0
# 	xset r rate 250 35
# fi

stty -ixon
shopt -s autocd

export LESS="--mouse -R"
export LESSHISTFILE=-
export EDITOR=nvim
export VISUAL=nvim

alias se=sudoedit
alias ls=exa
alias ll="ls -la"

export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin:~/go/bin
export PATH=$PATH:/Library/PostgreSQL/16/bin/
export PATH=$PATH:/usr/local/opt/mysql/bin

eval "$(starship init bash)"
eval "$(fnm env --use-on-cd)"
. "$HOME/.cargo/env"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
