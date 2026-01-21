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


