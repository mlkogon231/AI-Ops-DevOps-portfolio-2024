# backend.tf
terraform {
  backend "azurerm" {
    resource_group_name  = "aidemo-remotestate-rg"
    storage_account_name = "tfstatemlk231aidemo"
    container_name       = "aidemo-portfolio-state"
    key                  = "aiops-demo.terraform.tfstate"
  }
}