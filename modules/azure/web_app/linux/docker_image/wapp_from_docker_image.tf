resource "azurerm_linux_web_app" "example" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.region
  service_plan_id     = var.service_plan_id

  site_config {
    application_stack {
      docker_image_name = "datawire/hello-world:latest"
    }
  }
}