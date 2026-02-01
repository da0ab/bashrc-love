#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Этот скрипт требует прав суперпользователя."
    echo "Запуск с sudo..."
    exec sudo bash "$0" "$@"
fi

BACKUP_FILE="/root/.bashrc.backup.$(date +%Y%m%d_%H%M%S)"
if [[ -f /root/.bashrc ]]; then
    cp /root/.bashrc "$BACKUP_FILE"
    echo "Создан бэкап /root/.bashrc: $BACKUP_FILE"
else
    echo "Файл /root/.bashrc не существует, создается новый."
fi

cat > /root/.bashrc << 'EOF'
# Файл сгенерирован автоматически $(date)
# Исходный бэкап: $(basename "$BACKUP_FILE")

EOF

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASHRC_DIR="$SCRIPT_DIR/.bashrc.d"

if [[ -d "$BASHRC_DIR" ]]; then
    echo "Добавление конфигураций из $BASHRC_DIR..."

    FILES=(
        "01-exports.sh"
        "02-history.sh"
        "03-aliases.sh"
        "04-autocomplit.sh"
        "05-fzf-lsd-zoxide.sh"
        "08-lf.sh"
        "09-functions.sh"
        "root.sh"
    )

    for file in "${FILES[@]}"; do
        file_path="$BASHRC_DIR/$file"
        if [[ -f "$file_path" ]]; then
            echo "  Добавляется: $file"
            cat "$file_path" >> /root/.bashrc
            echo "" >> /root/.bashrc
        else
            echo "  Предупреждение: $file_path не найден, пропускается"
        fi
    done

    echo "Готово! Конфигурация /root/.bashrc обновлена."
    echo "Для применения изменений выполните: source /root/.bashrc"
else
    echo "Ошибка: Директория $BASHRC_DIR не найдена!"
    echo "Восстановление из бэкапа..."
    if [[ -f "$BACKUP_FILE" ]]; then
        cp "$BACKUP_FILE" /root/.bashrc
        echo "Восстановлено из: $BACKUP_FILE"
    fi
    exit 1
fi
