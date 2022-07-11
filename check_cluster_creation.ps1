$RETRY_LIMIT = 15
$RETRY_TIME = 60
$RETRY_COUNT = 0
for( $RETRY_COUNT = 1; $RETRY_COUNT -le $RETRY_LIMIT; $RETRY_COUNT++ ) {
    Write-Output "[INFO] Attempt $RETRY_COUNT of $RETRY_LIMIT"
    $HEADERS = @{
        "Authorization" = "Bearer $Env:DB_PAT"
    }
    $STATE = ((Invoke-RestMethod -Method GET -Uri "https://$(region).azuredatabricks.net/api/2.0/clusters/get?cluster_id=$Env:CLUSTER_ID" -Headers $HEADERS).state)
    if ($STATE -eq "RUNNING") {
        Write-Output "[INFO] Cluster is running, proceeding.."
        return
    } else {
        Write-Output "[INFO] Cluster is still not ready, current state: $STATE Next check in $RETRY_TIME seconds.."
        Start-Sleep -Seconds $RETRY_TIME
    }
}
Write-Output "[ERROR] No more attempts left, breaking.."
exit 1