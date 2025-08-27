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

module "web_app" {
  source          = "./modules/azure/web_app/linux/python_3-11"
  app_name        = var.app_name
  resource_group_name = azurerm_resource_group.rg.name
  region          = azurerm_resource_group.rg.location
  service_plan_id = azurerm_service_plan.deployed_app_service_plan.id
}