variable "_module_source" {
  default = "git::https://github.com/Mia-Platform-Experiments/tf-azure-servicebus.git"
}

variable "service_name" {
  description = "The name of the service (e.g., payment-service). Used for resource naming. Note: Service Bus namespace names must be globally unique in Azure."
  type        = string
  default     = "mia-azure-service-bus"
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

variable "queue_names" {
  description = "List of Service Bus queue names to create."
  type        = list(string)
  default     = [
  "default-queue"
]
}

variable "topic_names" {
  description = "List of Service Bus topic names to create."
  type        = list(string)
  default     = [
  "default-topic",
  "default-topic-2"
]
}