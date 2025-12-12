FROM nginx:1.28.0-alpine3.21-slim

# Удаляем стандартный конфиг
RUN rm /etc/nginx/conf.d/default.conf

# Копируем наш шаблон. Nginx будет использовать его для генерации конфига при старте.
COPY nginx.conf.template /etc/nginx/templates/default.conf.template
