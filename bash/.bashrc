if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

shopt -s autocd
alias ls='ls -F --color=auto'
alias ll='ls -lAF'
alias se='sudoedit'

nvimconf() {
    pushd ~/.config/nvim/ > /dev/null
    nvim init.lua
    popd > /dev/null
}

export EDITOR=nvim
export LESS="eFRX --mouse"
export LESSHISTFILE=-

eval "$(starship init bash)"
