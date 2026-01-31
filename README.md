# BASHRC-LOVE

![Лого](./img/logo.png)


## Структура

```
.bashrc
[].bashrc.d/
├──  01-exports.sh
├──  02-history.sh
├──  03-aliases.sh
├──  04-autocomplit.sh
├──  05-fzf-lsd-zoxide.sh
├──  06-prompt.sh
├──  07-superfile.sh
├──  08-lf.sh
└──  09-functions.sh
```

## Скрипт установки

``install-bashrc-love.sh``

``chmod +x install-bashrc-love.sh``


## Алиасы

### Навигация
- `..` - на уровень выше
- `...` - на два уровня выше

### Файлы
- `l` - дерево (1 уровень)
- `ll` - подробный список
- `la` - подробно со скрытыми
- `lt` - полное дерево

### Система
- `t` - дата и календарь
- `pa` - все процессы
- `k` - убить процесс
- `kk` - убить все процессы
- `kkk` - принудительно убить

### Оболочка
- `bsh` - перезагрузить bashrc
- `bin` - сделать исполняемым
- `c` - очистить экран
- `q` - выйти

### Редакторы и файловые менеджеры
- `vv` - vim
- `gg` - gvim
- `sv` - sudo gvim
- `ff` - lf
- `ss` - spf

### Мультимедиа
- `mm` - mocp
- `m` - alsamixer
- `sz` - скриншот области

### Python
- `ppp` - python3

### Git
- `gs` - статус
- `gc` - клонировать
- `mk` - собрать и установить

### Пакеты
- `new` - обновить систему
- `inst` - установить пакет
- `deb` - установить .deb
- `list` - редактировать sources.list

### Инфо
- `comp` - отчет о системе
- `about` - информация о системе


## Плагины
- ``Ctrl+r `` – поиск по истории
- ``Ctrl+t `` – интерактивный поиск
- ``zi`` – поиск по сохраненным спутям с параметром
- ``za`` - добавить папку
- ``zr`` - удалить папку


![История](./img/ctr-r.png)


- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [lsd](https://github.com/lsd-rs/lsd)
- [fzf](https://github.com/junegunn/fzf)

`` git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ``

Инсталляция `` ~/.fzf/install ``

![Пути](./img/zi.png)

## AnonymicePro Nerd Font Regular

``curl -fLo ~/.local/share/fonts/"AnonymicePro Nerd Font Regular.ttf" \
  https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/AnonymousPro/Regular/AnonymiceProNerdFont-Regular.ttf``
