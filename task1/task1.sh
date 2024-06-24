#!/bin/bash

# Список вебсайтів для перевірки
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Назва файлу логів
log_file="website_status.log"

# Очищення файлу логів перед записом нових результатів
> "$log_file"

# Функція для перевірки доступності вебсайту
check_website() {
    local url=$1
    # Виконуємо запит за допомогою curl з параметрами для перевірки статусу відповіді
    http_code=$(curl -o /dev/null -s -w "%{http_code}\n" -L "$url")
    if [ "$http_code" -eq 200 ]; then
        echo "<$url> is UP"
        echo "<$url> is UP" >> "$log_file"
    else
        echo "<$url> is DOWN"
        echo "<$url> is DOWN" >> "$log_file"
    fi
}

# Перевірка кожного вебсайту зі списку
for website in "${websites[@]}"; do
    check_website "$website"
done

# Вивід повідомлення про завершення роботи скрипту
echo "Результати записано у файл логів: $log_file"

