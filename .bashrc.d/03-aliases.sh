alias ..='cd ..'
alias ...='cd ../..'

alias l='lsd -a --tree --depth 1'
alias ll='lsd -l'
alias lll='lsd'
alias la='lsd -la'
alias lt='lsd -a --tree'
alias ls='ls --color=auto'

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




