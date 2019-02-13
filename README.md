# lady-bot
- Exemplo de requisição POST com a action `translate_pt-en`
```json
curl -X POST http://localhost:9292/webhook -H "Content-type: application/json" -d '{
	"queryResult": {
		"parameters": {
			"text": "livro"
		},
		"action": "translate_pt-en"
	}
}'
```
- Exemplo de requisição POST com a action `translate_en-pt`
```json
curl -X POST http://localhost:9292/webhook -H "Content-type: application/json" -d '{
	"queryResult": {
		"parameters": {
			"text": "book"
		},
		"action": "translate_en-pt"
	}
}'
```
- Exemplo de requisição POST com a action `help`
```json
curl -X POST http://localhost:9292/webhook -H "Content-type: application/json" -d '{
	"queryResult": {
		"action": "help"
	}
}'
```
