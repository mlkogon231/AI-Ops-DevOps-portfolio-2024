# providers.tf
terraform {
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

# variables.tf
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "aidemo-remotestate-rg"
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "westus2"
}

# main.tf
resource "azurerm_resource_group" "aiops_demo" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = "demo"
    project     = "aiops"
  }
}

# monitoring.tf
resource "azurerm_log_analytics_workspace" "demo" {
  name                = "aiops-demo-logs"
  location            = azurerm_resource_group.aiops_demo.location
  resource_group_name = azurerm_resource_group.aiops_demo.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "demo" {
  name                = "aiops-demo-insights"
  location            = azurerm_resource_group.aiops_demo.location
  resource_group_name = azurerm_resource_group.aiops_demo.name
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.demo.id
}

# outputs.tf
output "resource_group_name" {
  value = azurerm_resource_group.aiops_demo.name
}

output "application_insights_key" {
  value     = azurerm_application_insights.demo.instrumentation_key
  sensitive = true
}

