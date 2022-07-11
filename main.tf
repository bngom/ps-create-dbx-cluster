  resource "azurerm_template_deployment" "terraform-arm" {
  name     = "prashanthdemoadb"
   resource_group_name = "myresourcegroup11" 

  template_body = file("databricks-workspace-template.json")


  deployment_mode = "Incremental"


}

resource "null_resource" "example1" {
  provisioner "local-exec" {
    command     = ".\\newworkspace.ps1 "
    interpreter = ["PowerShell", "-Command"]
  }
}