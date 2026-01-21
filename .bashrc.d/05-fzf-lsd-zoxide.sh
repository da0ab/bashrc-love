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

