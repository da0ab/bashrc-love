# --- БИБЛИОТЕКА ТЕМ ---

# Тема 1: Powerline-стиль
function _prompt_zzz() {
    # Используем полную версию с Git-веткой для максимальной пользы
    function parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
    }
    # Цвета
    local CUSTOM_BG='\[\033[48;2;91;94;113m\]' # Твой фон #5b5e71
    local WHITE_FG='\[\033[38;5;255m\]'
    local ORANGE_BG='\[\033[48;5;215m\]'
    local BLACK_FG='\[\033[38;5;232m\]'
    local RESET='\[\033[0m\]'
    # Символы
    local SEPARATOR=''
    local GIT_SYMBOL=''

    # Сборка
    PS1=""
    PS1+="${CUSTOM_BG}${WHITE_FG} \w ${RESET}"
    local git_branch=$(parse_git_branch)
    if [ -n "$git_branch" ]; then
        PS1+="${ORANGE_BG}\[\033[38;2;91;94;113m\]${SEPARATOR}${RESET}"
        PS1+="${ORANGE_BG}${BLACK_FG}${GIT_SYMBOL}${git_branch} ${RESET}"
        PS1+="${RESET}\[\033[38;5;215m\]${SEPARATOR}${RESET}"
    else
        PS1+="${RESET}\[\033[38;2;91;94;113m\]${SEPARATOR}${RESET}"
    fi
    PS1+=" "
}




# Тема 2: Модерн
function _prompt_theme_modern() {
   local CYAN="\[\033[0;36m\]"
   local MAGENTA="\[\033[1;35m\]"
   local RESET="\[\033[0m\]"
local TIME_COLOR='\[\033[38;5;22m\]'
    local current_time=$(date +%H:%M)
     function _get_small_time() {
        local current_time=$(date +%H:%M)
        echo "$current_time" |  sed -e 'y/0123456789:/₀₁₂₃₄₅₆₇₈₉./'
    }
    local small_time=$(_get_small_time)


    PS1=""
    PS1+="${MAGENTA}"
    PS1+="╭ ${TIME_COLOR}${small_time}${RESET} ${CYAN}\w\n"
    PS1+="${MAGENTA}"
    PS1+="╰⊸ ${RESET}"
}


# Тема 3: С часами
function _prompt_theme_classic() {
    local current_time=$(date +%H:%M)
     function _get_small_time() {
        local current_time=$(date +%H:%M)
        echo "$current_time" |  sed -e 'y/0123456789:/₀₁₂₃₄₅₆₇₈₉./'
    }
    local TIME_COLOR="\[\033[38;5;38m\]"
    local PATH_COLOR="\[\033[38;5;49m\]"
    local ICON_COLOR="\[\033[38;5;213m\]"
    local RESET="\[\033[0m\]"
    local small_time=$(_get_small_time)

    PS1=""
    PS1+="${TIME_COLOR}${small_time}${RESET}"
    PS1+=" "
    PS1+="${PATH_COLOR}\w${RESET}"
    PS1+="\n"
    PS1+="${ICON_COLOR}⋇  ${RESET}"
}

# Тема 4: Стрела
function _prompt_theme_arrow() {
    local YELLOW="\[\033[0;33m\]"
    local CYAN="\[\033[0;36m\]"
    local RESET="\[\033[0m\]"
    PS1=""
    PS1+="${YELLOW}ᛗ"
    PS1+=" ${CYAN}\w "
    PS1+="${RESET}"
}


# --- ДВИЖОК УПРАВЛЕНИЯ ТЕМАМИ (v2.0) ---

# Команда для смены темы с короткими именами
function theme() {
    local theme_alias="$1"
    local theme_function_name=""

    # Сопоставляем короткое имя с полным именем функции
    case "$theme_alias" in
        powerline)
            theme_function_name="_prompt_zzz"
            ;;
        modern)
            theme_function_name="_prompt_theme_modern"
            ;;
        classic)
            theme_function_name="_prompt_theme_classic"
            ;;
        arrow)
            theme_function_name="_prompt_theme_arrow"
            ;;
        *) # Если введено что-то другое или ничего не введено
            echo "Использование: theme <имя_темы>"
            echo "Доступные темы:"
            echo "  powerline  - Стиль с цветными блоками и Git"
            echo "  modern     - Двухстрочный с уголками"
            echo "  classic    -  С часами"
            echo "  arrow      - С руной"
            return
            ;;
    esac

    # Сохраняем ВЫБРАННОЕ ПОЛНОЕ ИМЯ ФУНКЦИИ в файл
    echo "$theme_function_name" > ~/.bash_prompt_theme
    #echo "Тема изменена на '$theme_alias'"

    # Сразу применяем тему в текущей сессии
    PROMPT_COMMAND="_apply_prompt_theme"
    # Вызываем функцию, чтобы изменение применилось мгновенно
    _apply_prompt_theme
}

# Функция, которая будет запускаться перед каждым промтом (остается без изменений)
function _apply_prompt_theme() {
    local theme_name
    local default_theme="_prompt_zzz" # Тема по умолчанию

    if [ -f ~/.bash_prompt_theme ]; then
        theme_name=$(cat ~/.bash_prompt_theme)
    fi

    if ! declare -F "$theme_name" > /dev/null; then
        theme_name="$default_theme"
    fi

    "$theme_name"
}

# Главная команда: говорим Bash запускать наш движок перед каждым промтом
PROMPT_COMMAND="_apply_prompt_theme"
# Цвет курсора #fda500 (оранжевый)
#echo -ne "\033]12;#ba9a4c\007"
echo -ne "\033]12;#ba9a4c\007\e[4 q"
