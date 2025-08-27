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
resource "azurerm_linux_web_app" "example" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.deployed_app_service_plan.location
  service_plan_id     = azurerm_service_plan.deployed_app_service_plan.id

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }
}