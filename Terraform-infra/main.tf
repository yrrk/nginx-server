terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "8c0fa24a-0b95-469c-a372-b313faad17d4"
}

resource "azurerm_resource_group" "nginx-project" {
  name     = "nginx-project"
  location = "East US"
}
