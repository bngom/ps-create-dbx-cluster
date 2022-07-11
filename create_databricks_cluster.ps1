$HEADERS = @{
  "Authorization" = "Bearer $Env:DB_PAT"
  "Content-Type" = "application/json"
}

$BODY = @"
{
  "cluster_name": "$(clusterName)", 
  "spark_version": "$(clusterVersion)", 
  "autotermination_minutes": 30, 
  "num_workers": "$(clusterWorkersQuantity)", 
  "node_type_id": "$(clusterWorkersSize)",
  "driver_node_type_id": "$(clusterDriverSize)", 
  "custom_tags":{ 
    "project":"$(project)", 
    "environment":"$(environment)" 
  } 
}
"@

$CLUSTER_ID = ((Invoke-RestMethod -Method POST -Uri "https://$(region).azuredatabricks.net/api/2.0/clusters/create" -Headers $HEADERS -Body $BODY).cluster_id)

if ( $CLUSTER_ID -ne "null" ) {
  Write-Output "[INFO] CLUSTER_ID: $CLUSTER_ID"
  Write-Output "##vso[task.setvariable variable=CLUSTER_ID]$CLUSTER_ID"
} else {
  # Write-Output "[ERROR] cluster was not created"
  Write-Host  "##vso[task.LogIssue type=error;] Cluster was not created"
  exit 1
}