terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.29.1"
    } 
  }
}

provider "azurerm" {
  features {}
  alias = "sub1"
  subscription_id = "XXXXXXX"
}

provider "azurerm" {
  features {}  
  alias           = "sub2"
  subscription_id = "XXXXXXXX"
}
