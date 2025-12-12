#!/bin/bash
# Прерываем выполнение скрипта, если любая команда завершится с ошибкой
set -e

# Выполняем SQL-команды от имени суперпользователя postgres.
# psql автоматически подхватит переменные POSTGRES_USER и POSTGRES_PASSWORD из окружения
# для аутентификации.
# Мы используем "here document" (<<-EOSQL) для передачи многострочного SQL.
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Создаем пользователя для n8n, если он еще не существует
    DO \$\$
    BEGIN
        IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = '${N8N_DB_USER}') THEN
            CREATE ROLE ${N8N_DB_USER} WITH LOGIN PASSWORD '${N8N_DB_PASSWORD}';
        END IF;
    END
    \$\$;

    -- Создаем базу данных для n8n, если она еще не существует
    -- Сначала отключаемся от текущей БД, чтобы ее можно было удалить/пересоздать (если нужно для тестов)
    -- и устанавливаем владельца
    SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '${N8N_DB_NAME}';
    DROP DATABASE IF EXISTS ${N8N_DB_NAME};
    CREATE DATABASE ${N8N_DB_NAME} WITH OWNER = ${N8N_DB_USER};
    GRANT ALL PRIVILEGES ON DATABASE ${N8N_DB_NAME} TO ${N8N_DB_USER};
EOSQL
