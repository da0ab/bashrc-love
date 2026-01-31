# FZF конфигурация
FZF_BASE="--height=90% --layout=reverse --border=rounded --margin=1 --padding=1 --pointer='▋'"

export FZF_DEFAULT_OPTS="$FZF_BASE --prompt=' поищемкА! ' \
    --preview='ls -la --color=always {} 2>/dev/null | head -200' \
    --preview-window='down:10%:border-top'"

# Интерактивный поиск fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_CTRL_R_OPTS="--layout=reverse --border=rounded --info=inline \
    --header 'История команд' --prompt 'Искать: ' --pointer='▋' --marker='✓' --tac"

# Умная навигация по каталогам zoxide
eval "$(zoxide init bash)"

zi() {
    cd -- "$(zoxide query -l -- "$@" | fzf --height=80% \
        --prompt='прыгнуть в ➜ ' \
        --preview='ls -la --color=always {} 2>/dev/null | head -200' \
        --preview-window='down:50%:border-top')" 2>/dev/null || return

    lsd -a --tree --depth 1
}
