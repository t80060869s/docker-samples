#!/bin/bash
set -e

echo "=== Остановка dev-среды ==="

# Останавливаем контейнеры
docker-compose -f docker-compose.dev.yaml down
# docker-compose -f docker-compose.dev.yaml down -v

# Опционально: можно удалить Postgres и Redis
# read -p "Хотите удалить PostgreSQL и Redis контейнеры? [y/N]: " yn
# case $yn in
#     [Yy]* ) 
#         docker rm -f postgres_db redis_dev || true
#         echo "Контейнеры удалены."
#         ;;
#     * ) echo "Контейнеры оставлены." ;;
# esac

echo "=== Dev-среда остановлена ==="
