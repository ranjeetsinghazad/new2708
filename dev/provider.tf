terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.2.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "9246877f-9bea-4e72-9d6d-6b6d49d180df"
}
