if [[ $XDG_SESSION_TYPE == "x11" ]] then
    xinput --set-prop "pointer:Logitech MX Master 3" "libinput High Resolution Wheel Scroll Enabled" 0
    xinput --set-prop "pointer:Logitech MX Master 3" "libinput Accel Profile Enabled" 0, 1
    xinput --set-prop "pointer:Logitech MX Master 3" "libinput Accel Speed" 0
    xset r rate 250 35
fi

shopt -s autocd
stty -ixon

export LESS="--mouse -R"
export LESSHISTFILE=-
export EDITOR=nvim
export VISUAL=nvim
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin:~/go/bin:~/.cargo/bin

alias se=sudoedit
alias ls=eza
alias ll="ls -la"
alias lt="ls -T"
alias lg=lazygit


eval "$(starship init bash)"
[ -f ~/.cargo/env ] && . "$HOME/.cargo/env"
source /usr/share/doc/fzf/examples/key-bindings.bash

if [[ $(uname -r) =~ microsoft ]]; then
    alias goland=goland64.exe
    alias clip=clip.exe
    alias open=explorer.exe
    export DISPLAY=:0
    export BROWSER=/usr/bin/wslview
    export PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"'
fi
