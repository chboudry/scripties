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
  subscription_id = "dc8988ff-b13d-4b92-b3f6-af40b06b9be8"
}

provider "azurerm" {
  features {}  
  alias           = "sub2"
  subscription_id = "320c35fb-03ca-42b2-a67d-46a71839aad1"
}