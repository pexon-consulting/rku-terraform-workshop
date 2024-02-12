resource "azurerm_resource_group" "my-resource-group" {
  name = "rg-${local.base_name}-storage"
  location = local.location
}