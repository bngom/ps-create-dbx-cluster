 $VALIDATION_OUTPUT = (az deployment group validate --resource-group '$(rgName)' --template-file $(System.DefaultWorkingDirectory)/_databricks/drop/databricks-workspace-template.json --parameters project=$(project) environment=$(environment) workspaceName=$(workspaceName) | jq --raw-output '.error')
          if ( $VALIDATION_OUTPUT -eq "null" ) {
            Write-Output "[INFO] validation passed successfully"
          } else {
            Write-Output "[ERROR] validation failed: $VALIDATION_OUTPUT"
            exit 1
          }