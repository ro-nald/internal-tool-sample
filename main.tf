resource "azurerm_resource_group" "rg" {
  name     = "my-terraform-resource-group"
  location = var.deployment_azure_region
}