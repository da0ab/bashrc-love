user_name="termux"
editor="vim"

export GREP_COLOR="1;32"
export MANPAGER="less -R --use-color -Dd+g -Du+b"
export EDITOR=$editor
export SUDO_EDITOR=$editor
export VISUAL="vim"
export USER=$user_name
export ETC="/data/data/com.termux/files/usr/etc"

bind 'TAB:menu-complete'
shopt -s extglob
shopt -s autocd
