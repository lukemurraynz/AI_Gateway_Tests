# Define the headers
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("api-key", "b352f426be53484f8520e5502285264c")
$headers.Add("Content-Type", "application/json")

# Define the body
$body = @"
{
    `"messages`": [
        {
            `"role`": `"system`",
            `"content`": `"You are a knowledgeable assistant in an ice cream parlor.`"
        },
        {
            `"role`": `"user`",
            `"content`": `"What are the ingredients typically used to make a classic vanilla ice cream?`"
        }
    ],
    `"max_tokens`": 100
}
"@

# Loop to run the script 20 times
for ($i = 1; $i -le 20; $i++) {
    try {
        # Send the request and capture the response
        $response = Invoke-RestMethod 'https://apim-lmv01-dev-eastus-aka.azure-api.net/openai/deployments/gpt-4o/chat/completions?api-version=2024-02-15-preview' -Method 'POST' -Headers $headers -Body $body

        # Output the response as JSON
        $responseJson = $response | ConvertTo-Json -Depth 10
     
        Write-Output $responseJson
    } catch {
        # Handle any errors that occur during the request
        Write-Error $_.Exception.Message
    }
}
