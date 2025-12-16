terraform {
  cloud {
    organization = "mia-platform"
    workspaces {
      name = "hcp-terraform-demo"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "my-azure-postgresql" {
  source = "git::https://github.com/Mia-Platform-Experiments/tf-azure-postgresql.git"

  service_name = var.my-azure-postgresql_service_name
  resource_group_name = var.my-azure-postgresql_resource_group_name
  location = var.my-azure-postgresql_location
  performance_profile = var.my-azure-postgresql_performance_profile
  postgres_version = var.my-azure-postgresql_postgres_version
  database_name = var.my-azure-postgresql_database_name
  administrator_login = var.my-azure-postgresql_administrator_login
  administrator_password = var.my-azure-postgresql_administrator_password
}

module "my-azure-storage-account" {
  source = "git::https://github.com/Mia-Platform-Experiments/tf-azure-storage.git"

  service_name = var.my-azure-storage-account_service_name
  resource_group_name = var.my-azure-storage-account_resource_group_name
  location = var.my-azure-storage-account_location
  performance_profile = var.my-azure-storage-account_performance_profile
  container_names = var.my-azure-storage-account_container_names
  access_tier = var.my-azure-storage-account_access_tier
}

module "my-azure-service-bus" {
  source = "git::https://github.com/Mia-Platform-Experiments/tf-azure-servicebus.git"

  service_name = var.my-azure-service-bus_service_name
  resource_group_name = var.my-azure-service-bus_resource_group_name
  location = var.my-azure-service-bus_location
  performance_profile = var.my-azure-service-bus_performance_profile
  queue_names = var.my-azure-service-bus_queue_names
}

module "node-azure-app-service" {
  source = "git::https://github.com/Mia-Platform-Experiments/tf-azure-app-service.git"

  service_name = var.node-azure-app-service_service_name
  deployed_service = var.node-azure-app-service_deployed_service
  resource_group_name = var.node-azure-app-service_resource_group_name
  location = var.node-azure-app-service_location
  performance_profile = var.node-azure-app-service_performance_profile
  tech_stack = var.node-azure-app-service_tech_stack
}

module "python-azure-app-service" {
  source = "git::https://github.com/Mia-Platform-Experiments/tf-azure-app-service.git"

  service_name = var.python-azure-app-service_service_name
  deployed_service = var.python-azure-app-service_deployed_service
  resource_group_name = var.python-azure-app-service_resource_group_name
  location = var.python-azure-app-service_location
  performance_profile = var.python-azure-app-service_performance_profile
  tech_stack = var.python-azure-app-service_tech_stack
}

# Output deployment mapping for CD pipeline
output "deployments" {
  description = "Deployment information for app-service modules"
  value = {
    node-azure-app-service = {
      webapp_name      = module.node-azure-app-service.webapp_name
      deployed_service = module.node-azure-app-service.deployed_service
    }
    python-azure-app-service = {
      webapp_name      = module.python-azure-app-service.webapp_name
      deployed_service = module.python-azure-app-service.deployed_service
    }
  }
}
