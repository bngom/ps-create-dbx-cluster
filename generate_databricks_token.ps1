
$TenantId = (Get-AzContext).Tenant.Id
$ResourceGroup = ""
$Location = "eastus2"
$ResourceUrl = "https://management.core.windows.net/"
$DatabricksWorkspace = 

$WORKSPACE_ID = (Get-AzDatabricksWorkspace -ResourceGroupName "MyRG" -Name "MyWorkspaceName").WorkspaceId
$AZ_TOKEN = (Get-AzAccessToken -ResourceUrl $ResourceUrl).AccessToken
$TOKEN = (Get-AzAccessToken -TenantId $TenantId).AccessToken

$HEADERS = @{
    "Authorization" = "Bearer $TOKEN"
    "X-Databricks-Azure-SP-Management-Token" = "$AZ_TOKEN"
    "X-Databricks-Azure-Workspace-Resource-Id" = "$WORKSPACE_ID"
}
$BODY = @'
{ "lifetime_seconds": 1200, "comment": "Azure DevOps pipeline" }
'@
# todo: get the token from the keyvault later
$DB_PAT = ((Invoke-RestMethod -Method POST -Uri "https://$(region).azuredatabricks.net/api/2.0/token/create" -Headers $HEADERS -Body $BODY).token_value)
Write-Output "##vso[task.setvariable variable=DB_PAT]$DB_PAT"

