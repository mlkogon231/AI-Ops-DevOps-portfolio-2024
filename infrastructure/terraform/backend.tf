# backend.tf
terraform {
  backend "azurerm" {
    resource_group_name  = "ai-demo-state-rg"
    storage_account_name = "tfstatemlkaidemo"
    container_name       = "tfstate"
    key                  = "aiops-demo.terraform.tfstate"
  }
}