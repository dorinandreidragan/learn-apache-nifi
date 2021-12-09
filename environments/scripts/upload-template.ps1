$baseUri = "http://192.168.1.20:8080/nifi-api"

# TODO: how to get the clientID
$clientId = "9dd1e74c-017d-1000-b4f8-f4925d84a0db"
# TODO: how to get the rootProcesGroup ID
$rootProcessGroupId = "9dba28f0-017d-1000-e56f-d66e4266136c"
$createProcessUri = "$baseUri/process-groups/$rootProcessGroupId/process-groups"
$processGroupJson = @"
{
    `"revision`":{
        `"clientId`":`"$clientId`",
        `"version`":0
    },
    `"disconnectedNodeAcknowledged`":false,
    `"component`":{
        `"name`":`"test-group`",
        `"position`":{
            `"x`":444,
            `"y`":155
        }
    }
}
"@

Invoke-RestMethod -Uri $createProcessUri -Method Post -Body $processGroupJson -ContentType 'application/json'

$processGroupId = "9debbed7-017d-1000-8969-eb601d729fb6"
$createTemplateUri = "$baseUri/process-groups/$processGroupId/templates/upload"

# $headers = @{'Auth_token'=$AUTH_TOKEN};
$contentType = "multipart/form-data"
# $body = @{
#     "FileName" = Get-Content("$PSScriptRoot/../../demos/wikipedia/wikipedia-flow.xml") -Raw
# }
$path = "$PSScriptRoot/../../demos/wikipedia/wikipedia-flow.xml"
$body = @{
    "id" = $processGroupId,
    @{
        "template" = Get-Content($path) -Raw
    }
}
# Invoke-RestMethod -Uri $createTemplateUri -Method Post -ContentType $contentType -Body $body