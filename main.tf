resource "azurerm_resource_group" "rg" {
  name     = "my-terraform-resource-group"
  location = var.deployment_azure_region
}
resource "azurerm_service_plan" "deployed_app_service_plan" {
  name                = var.app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}