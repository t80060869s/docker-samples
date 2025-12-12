# Настройка сертификатов и доменов для локальной разработки

## Настройка локальных доменов в hosts

```
127.0.0.1  aijobagent.local
127.0.0.1  n8n.aijobagent.local
127.0.0.1  admin.aijobagent.local
127.0.0.1  api.aijobagent.local
```

---

## Генерация сертификатов для локальной разработки

Выполните в корневой папке проекта:

`mkcert -install`  
`mkcert -cert-file certs/aijobagent.local.pem -key-file certs/aijobagent.local-key.pem "aijobagent.local" "n8n.aijobagent.local" "admin.aijobagent.local" "api.aijobagent.local"`
