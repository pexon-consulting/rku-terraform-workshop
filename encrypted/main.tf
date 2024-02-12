terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

locals {
  base_name = "ws-pj"
  location = "westeurope"
}