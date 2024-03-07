if [[ $XDG_SESSION_TYPE == "x11" ]] then
    xinput --set-prop "pointer:Logitech MX Master 3" "libinput High Resolution Wheel Scroll Enabled" 0
    xinput --set-prop "pointer:Logitech MX Master 3" "libinput Accel Profile Enabled" 0, 1
    xinput --set-prop "pointer:Logitech MX Master 3" "libinput Accel Speed" 0
    xset r rate 250 35
fi

stty -ixon
shopt -s autocd

export LESS="--mouse -R"
export LESSHISTFILE=-
export EDITOR=nvim
export VISUAL=nvim
export LANG=en_US.UTF-8
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin:~/go/bin
export PATH=$PATH:/usr/local/opt/postgresql@16/bin

alias se=sudoedit
alias ls=eza
alias ll="ls -la"
alias lt="ls -T"

eval "$(starship init bash)"
eval "$(fnm env --use-on-cd)"
. "$HOME/.cargo/env"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/joiput/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/joiput/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/joiput/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/joiput/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
