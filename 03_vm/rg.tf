resource "azurerm_resource_group" "rg" {
  name = "rg-${local.base_name}-vm"
  location = local.location
}