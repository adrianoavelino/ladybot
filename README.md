# lady-bot
## Exemplo de requisição POST com a action `translate`
```json
curl -X POST http://localhost:9292/webhook -H "Content-type: application/json" -d '{ "queryResult": { "parameters": { "text": "livro", "direction_of_translation": "pt-en" }, "action": "translate" } }'
```
## Exemplo de requisição POST com a action `help`
```json
curl -X POST http://localhost:9292/webhook -H "Content-type: application/json" -d '{ "queryResult": { "action": "help" } }'
```
