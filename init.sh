#!/bin/bash

# Создание файла
echo "Hello, world!" > file.txt

# Инициализация git-репозитория
git init

# Первый коммит
git add file.txt
git commit -m "Initial commit"

# Текущая дата в секундах
current_date_sec=$(date +%s)

# Генерация коммитов с датами в прошлом
for ((i=1; i<=1000; i++))
do
  # Рандомное изменение файла
  echo "Random change $i" >> file.txt
  
  # Вычисление даты (i дней назад от текущей даты)
  commit_date_sec=$((current_date_sec - i * 86400))  # 86400 секунд в дне
  commit_date=$(date -d "@$commit_date_sec" "+%Y-%m-%d 12:00:00" 2>/dev/null || date -r "$commit_date_sec" "+%Y-%m-%d 12:00:00")
  
  # Добавление изменений и коммит с указанной датой
  git add file.txt
  GIT_COMMITTER_DATE="$commit_date" git commit --date "$commit_date" -m "Commit $i"
done