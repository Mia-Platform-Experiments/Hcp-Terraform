variable "_module_source" {
  default = "git::https://github.com/Mia-Platform-Experiments/tf-azure-storage.git"
}

variable "service_name" {
  description = "The name of the service (e.g., paymentservice). Used for storage account naming. Must be 3-24 lowercase alphanumeric characters. Note: Storage account names must be globally unique in Azure."
  type        = string
  default     = "miastorageaccount"

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.service_name))
    error_message = "Service name must be 3-24 lowercase alphanumeric characters only (no hyphens or special characters)."
  }
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
  description = "The performance tier selected by the developer (sandbox, development, production). Account tier and replication type are automatically configured based on this profile."
  type        = string
  default     = "sandbox"

  validation {
    condition     = contains(["sandbox", "development", "production"], var.performance_profile)
    error_message = "Performance profile must be one of: sandbox, development, production."
  }
}

variable "container_names" {
  description = "List of blob container names to create (optional)."
  type        = list(string)
  default     = [
  "default-container",
  "container-2"
]
}

variable "access_tier" {
  description = "The access tier for the storage account."
  type        = string
  default     = "Hot"
}