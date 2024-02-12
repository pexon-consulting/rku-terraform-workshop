terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

locals {
  base_name = "workshop-pj"
  location = "westeurope"
}