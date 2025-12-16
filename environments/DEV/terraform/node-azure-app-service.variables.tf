variable "node-azure-app-service__module_source" {
  default = "git::https://github.com/Mia-Platform-Experiments/tf-azure-app-service.git"
}

variable "node-azure-app-service_service_name" {
  description = "The name of the service (e.g., payment-service). Used for resource naming."
  type        = string
  default     = "mia-node-azure-app-service"
}

variable "node-azure-app-service_deployed_service" {
  description = "Service to be deployed (e.g., 'service-hello-world')"
  type        = string
  default     = "tf-demo-node-hello-world"
}

variable "node-azure-app-service_resource_group_name" {
  description = "The name of the existing Resource Group in Azure."
  type        = string
  default     = "terraform-demo"
}

variable "node-azure-app-service_location" {
  description = "The Azure region to deploy to."
  type        = string
  default     = "North Europe"
}

variable "node-azure-app-service_performance_profile" {
  description = "The performance tier selected by the developer (sandbox, development, production)."
  type        = string
  default     = "sandbox"

  validation {
    condition     = contains(["sandbox", "development", "production"], var.node-azure-app-service_performance_profile)
    error_message = "Performance profile must be one of: sandbox, development, production."
  }
}

variable "node-azure-app-service_tech_stack" {
  description = "The runtime stack for the application."
  type        = string
  default     = "Node.js 18 LTS"
}