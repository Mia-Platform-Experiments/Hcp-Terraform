variable "_module_source" {
  default = "git::https://github.com/Mia-Platform-Experiments/tf-azure-app-service.git"
}

variable "service_name" {
  description = "The name of the service (e.g., payment-service). Used for resource naming."
  type        = string
  default     = "mia-node-azure-app-service"
}

variable "deployed_service" {
  description = "Service to be deployed (e.g., 'service-hello-world')"
  type        = string
  default     = "tf-demo-node-hello-world"
}

variable "resource_group_name" {
  description = "The name of the existing Resource Group in Azure."
  type        = string
  default     = "terraform-demo"
}

variable "location" {
  description = "The Azure region to deploy to."
  type        = string
  default     = "West Europe"
}

variable "performance_profile" {
  description = "The performance tier selected by the developer (sandbox, development, production)."
  type        = string
  default     = "sandbox"

  validation {
    condition     = contains(["sandbox", "development", "production"], var.performance_profile)
    error_message = "Performance profile must be one of: sandbox, development, production."
  }
}

variable "tech_stack" {
  description = "The runtime stack for the application."
  type        = string
  default     = "Node.js 18 LTS"
}