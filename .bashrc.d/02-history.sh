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
