variable "_module_source" {
  default = "git::https://github.com/Mia-Platform-Experiments/tf-azure-postgresql.git"
}

variable "service_name" {
  description = "The name of the service (e.g., payment-service). Used for resource naming. Note: PostgreSQL server names must be globally unique in Azure."
  type        = string
  default     = "mia-azure-postgresql-demo"
}

variable "resource_group_name" {
  description = "The name of the existing Resource Group in Azure."
  type        = string
  default     = "terraform-demo"
}

variable "location" {
  description = "The Azure region to deploy to."
  type        = string
  default     = "North Europe"
}

variable "performance_profile" {
  description = "The performance tier selected by the developer (sandbox, development, production). Storage size, backup retention, and high availability are automatically configured based on this profile."
  type        = string
  default     = "sandbox"

  validation {
    condition     = contains(["sandbox", "development", "production"], var.performance_profile)
    error_message = "Performance profile must be one of: sandbox, development, production."
  }
}

variable "postgres_version" {
  description = "The PostgreSQL version to deploy."
  type        = string
  default     = "16"
}

variable "database_name" {
  description = "The name of the database to create."
  type        = string
  default     = "mia-azure-postgresql-demo"
}

variable "administrator_login" {
  description = "The administrator username for the PostgreSQL server."
  type        = string
  default     = "psqladmin"
}

variable "administrator_password" {
  description = "The administrator password for the PostgreSQL server. Note: Change this default value before deploying to production."
  type        = string
  default     = "change_me"
  sensitive   = true
}