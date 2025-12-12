#!/bin/bash
set -e

echo "=== Запуск dev-среды ==="

# Проверка .env
if [ ! -f .env ]; then
    echo "Файл .env не найден! Скопируйте .env.example в .env"
    exit 1
fi

# Сборка и запуск контейнеров
echo "Сборка и запуск контейнеров..."
docker-compose -f docker-compose.dev.yaml up --build -d

echo "=== Dev-среда готова! ==="
echo "FastAPI: https://api.aijobagent.local"
echo "n8n: https://n8n.aijobagent.local"
echo "Appsmith: https://admin.aijobagent.local"
echo "Интерфейс приложения: https://aijobagent.local"
echo "Не забудьте добавить домены в /etc/hosts:"
echo "127.0.0.1 aijobagent.local n8n.aijobagent.local admin.aijobagent.local api.aijobagent.local"
