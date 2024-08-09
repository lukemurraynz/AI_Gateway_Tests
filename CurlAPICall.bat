curl --location 'https://apim-lmv01-dev-eastus-aka.azure-api.net/openai/deployments/gpt-4o/chat/completions?api-version=2024-02-15-preview' \
--header 'api-key: b352f426be53484f8520e5502285264c' \
--header 'Content-Type: application/json' \
--data '{
    "messages": [
        {
            "role": "system",
            "content": "You are a knowledgeable assistant in an ice cream parlor."
        },
        {
            "role": "user",
            "content": "What are the ingredients typically used to make a classic vanilla ice cream?"c
        }
    ],
    "max_tokens": 100

}'
