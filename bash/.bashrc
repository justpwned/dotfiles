if [[ $XDG_SESSION_TYPE == "x11" ]] then
    xinput --set-prop "pointer:Logitech MX Master 3" "libinput High Resolution Wheel Scroll Enabled" 0
    xinput --set-prop "pointer:Logitech MX Master 3" "libinput Accel Profile Enabled" 0, 1
    xinput --set-prop "pointer:Logitech MX Master 3" "libinput Accel Speed" -0.2
    xset r rate 250 35
    xrdb ~/.Xresources
else
    export MOZ_ENABLE_WAYLAND=1
fi

# Disable <c-s> terminal mapping
stty -ixon
shopt -s autocd

export LESS="--mouse"
export LESSHISTFILE=-
export EDITOR=nvim
export VISUAL=nvim

alias se=sudoedit
alias ls=exa

export PATH=$PATH:/usr/local/go/bin:~/go/bin
