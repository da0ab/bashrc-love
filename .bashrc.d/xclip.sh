# Быстрое копирование пути текущей директории
alias cpwd='pwd | xclip -selection clipboard'

# Копировать имя текущей директории
alias cdir='basename "$(pwd)" | xclip -selection clipboard'

# Копировать содержимое файла
alias ccat='xclip -selection clipboard <'

# Копировать вывод последней команды
alias clast='fc -ln -1 | xclip -selection clipboard'

# Копировать выбранные файлы (после команды ls и т.д.)
alias cpf='copy_filepath.sh'
alias cfn='copy_filename.sh'
alias cfl='copy_filelist.sh'
