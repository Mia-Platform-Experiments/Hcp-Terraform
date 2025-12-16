variable "my-azure-service-bus__module_source" {
  default = "git::https://github.com/Mia-Platform-Experiments/tf-azure-servicebus.git"
}

variable "my-azure-service-bus_service_name" {
  description = "The name of the service (e.g., payment-service). Used for resource naming. Note: Service Bus namespace names must be globally unique in Azure."
  type        = string
  default     = "mia-azure-service-bus"
}

variable "my-azure-service-bus_resource_group_name" {
  description = "The name of the existing Resource Group in Azure."
  type        = string
  default     = "terraform-demo"
}

variable "my-azure-service-bus_location" {
  description = "The Azure region to deploy to."
  type        = string
  default     = "North Europe"
}

variable "my-azure-service-bus_performance_profile" {
  description = "The performance tier selected by the developer (sandbox, development, production)."
  type        = string
  default     = "sandbox"

  validation {
    condition     = contains(["sandbox", "development", "production"], var.my-azure-service-bus_performance_profile)
    error_message = "Performance profile must be one of: sandbox, development, production."
  }
}

variable "my-azure-service-bus_queue_names" {
  description = "List of Service Bus queue names to create."
  type        = list(string)
  default     = [
  "default-queue"
]
}