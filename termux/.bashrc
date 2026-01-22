# Generated from bashrc.d files

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
shopt -s histappend
PROMPT_COMMAND='history -a'

export HISTCONTROL=ignoredups:ignorespace:erasedups
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:cd:sss:ss:la:l:ll:lt:lf"
history_filter() {
  local last_command=$(fc -ln -1)
  local trimmed_command="${last_command##*( )}"
  if [[ ${#trimmed_command} -le 3 ]]; then
    history -d $((HISTCMD-1))
  fi
}
HISTSIZE=5000
HISTFILESIZE=5000
alias ..='cd ..'
alias ...='cd ../..'

alias l='lsd -a --tree --depth 1'
alias ll='lsd -l'
alias la='lsd -la'
alias lt='lsd -a --tree'

alias mkdir='mkdir -p -v'
alias cp='cp --preserve=all'
alias cpv='cp --preserve=all -v'
alias cpr='cp --preserve=all -R'

alias t='date & cal'

alias pa='ps ax'
alias k='kill'
alias kk='killall -SIGTERM'
alias kkk='kill -s KILL'

alias bsh='source ~/.bashrc'
alias bin='chmod +x -R '
alias c='clear'
alias q='exit'

alias vv='vim'
alias gg='gvim'
alias sv='sudo gvim'
alias ff='lf'
alias ss='spf'
alias mm='mocp'
alias m='alsamixer'
alias sz='scrot -s -d 0 'screenshot_%y-%m-%d_%H:%M:%S.png''

alias ppp='python3'

alias gs='git status'
alias gc='git clone'
alias mk='make && sudo make install'

alias new='sudo apt-get update && sudo apt-get upgrade'
alias inst='sudo apt-get update && sudo apt-get install'
alias deb='sudo dpkg -i'
alias list='sudo gvim /etc/apt/sources.list'

alias comp='sudo lshw -html > system_info.html'
alias about='uname -a & lsb_release -a & ifconfig -a'




alias pig="pkg install"
alias bsh='source ~/.bashrc'
alias bsh-='vim ~/.bashrc'
shopt -s cmdhist
shopt -s globstar
shopt -s autocd
shopt -s checkwinsize

# Умная навигация по каталогам zoxide
eval "$(zoxide init bash)"

zi() {
    local d
    d="$(zoxide query -l -- "$@" | fzf \
        --height=50% \
        --layout=reverse \
        --border=rounded \
        --margin=1 \
        --padding=1 \
        --prompt='прыгнуть в  ➜ ' \
        --pointer='▋' \
        --preview='ls -a --color=always {} | head -n 200' \
        --preview-window=down:50%:border-top \
    )" || return
    cd -- "$d"
}

# Интерактивный поиск fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_CTRL_R_OPTS=" \
 --layout=reverse \
 --border=rounded \
 --info=inline \
 --header 'Поиск по истории команд' \
 --prompt 'Искать: ' \
 --pointer='▋' \
 --marker='✓' \
 --tac"

# Цвета
USER_COLOR="214"    # Оранжевый
HOST_COLOR="32"     # Зелёный
PATH_COLOR="39"     # Голубой для пути

# Символы
PROMPT_ICON="ᛗ"    # Символ при старте
PROMPT_SYMBOL="$"   # Символ $

_set_prompt() {
    local prompt_type

    if [[ -n "$SSH_CONNECTION" ]]; then
        prompt_type="ssh"
    elif [[ $EUID -eq 0 ]]; then
        prompt_type="root"
    else
        prompt_type="local"
    fi

    case $prompt_type in
        "local")
            # Локально:  ~/
PS1='\[\e[0;34m\]╔═ \[\e[0;36m\]\w\n\[\e[0;34m\]╚═\[\e[1;35m\] ◎ \[\e[0m\]'
            ;;

        "root")
            # Root: @root ~/ $
            PS1="\[\e[38;5;196m\]@root \[\e[38;5;${PATH_COLOR}m\]\w\[\e[0m\] ${PROMPT_SYMBOL} "
            ;;

        "ssh")
            # SSH: @remote-host ~/ $
            PS1="\[\e[38;5;${USER_COLOR}m\]${PROMPT_ICON}\[\e[38;5;${HOST_COLOR}m\]@\h \[\e[38;5;${PATH_COLOR}m\]\w\[\e[0m\] ${PROMPT_SYMBOL} "
            ;;
    esac
}
PROMPT_COMMAND="history_filter; _set_prompt"

# Устанавливаем цвет курсора (оранжевый)
echo -ne "\033]12;#ba9a4c\007"
# Файл менеджер lf выход с сохранением последней директории
lf() {
    tmp="$(mktemp)"
    command lf -last-dir-path="$tmp" "$@"

    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ] && [ "$dir" != "$(pwd)" ]; then
            cd "$dir"
        fi
    fi
}
# бекап папки или файла
bk() {
    if [ $# -eq 0 ]; then
        echo "Использование: bk <имя_файла_или_папки>"
        echo "               bk <файл1> <файл2> ..."
        return 1
    fi

    for item in "$@"; do
        if [ ! -e "$item" ]; then
            echo "Предупреждение: '$item' не существует, пропускаем"
            continue
        fi

        backup_name="${item}_bk"
        counter=1
        while [ -e "$backup_name" ]; do
            backup_name="${item}_bk${counter}"
            counter=$((counter + 1))
        done

        if [ -d "$item" ]; then
            cp -r "$item" "$backup_name"
            echo "Папка: $item → $backup_name"
        else
            cp "$item" "$backup_name"
            echo "Файл: $item → $backup_name"
        fi
    done
}


# Display

clear
echo -e "\e[0;37m"
echo '     ██╗  █████╗  ██╗     '
echo '     ██║ ██╔══██╗ ██║     '
echo ' ██████║ ██║  ██║ ██████╗ '
echo '██╔══██║ ██║  ██║ ██╔══██╗'
echo '██║  ██║ ██╚══██║ ██║  ██║'
echo '██████╔╝ ╚█████╔╝ ██████╔╝'
echo
echo
