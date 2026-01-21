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
