# Azure Provider source and version being used
terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.37.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "FRED"
    storage_account_name = "iaaclabs"
    container_name       = "iaacazuretfwebapp"
    key                  = "terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}