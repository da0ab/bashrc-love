prompt_my() {
   local CYAN="\[\033[0;36m\]"
   local MAGENTA="\[\033[1;35m\]"
   local TIME_COLOR='\[\033[38;5;22m\]'
   local RESET="\[\033[0m\]"
   local RED="\[\033[1;31m\]"
   local YELLOW="\[\033[0;33m\]"

   function _get_small_time() {
     local current_time=$(date +%H:%M)
     echo "$current_time" | sed -e 'y/0123456789:/₀₁₂₃₄₅₆₇₈₉./'
   }
   local small_time=$(_get_small_time)

    PS1=""
    PS1+="${MAGENTA}"
    PS1+="╭ ${TIME_COLOR}${small_time}${RESET} ${CYAN}\w\n"
    PS1+="${MAGENTA}"
    PS1+="╰⊸ ${RESET}"

}

PROMPT_COMMAND="prompt_my; history_filter"
# Цвет курсора
echo -ne "\033]12;#ba9a4c\007"
#echo -ne "\033]12;#ba9a4c\007\e[4 q"
