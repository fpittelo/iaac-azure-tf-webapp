# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "a6f24a81-7804-44a9-b074-25a9781afd24"
  tenant_id       = "4c8896b7-52b2-4cb4-9533-1dc0c937e1ed"
}