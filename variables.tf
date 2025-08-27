variable "app_name" {
  description = "Name of the app to deploy. Default is 'example-app'"
  type        = string
  default     = "example-app"
  validation {
    condition     = can(regex("^[a-zA-Z0-9_-]{1,60}$", var.app_name))
    error_message = "The resource name must be alphanumeric, contain dashes or underscores, and be between 1 and 60 characters long."
  }
}

variable "deployment_azure_region" {
  description = "The Azure region in which to deploy. By default, this is 'westeurope' (West Europe)"
  type        = string
  default     = "westeurope"
}