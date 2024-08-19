# declare provider
terraform {

  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.53.1"
    }

  }

}

# configure provider
provider "azurerm" {
  features {}
}


provider "kubernetes" {
  # Configuration options
}


provider "azuread" {
  # Configuration options
}