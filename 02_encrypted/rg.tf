resource "azurerm_resource_group" "my-resource-group" {
  name = "rg-${local.base_name}-encrypted"
  location = local.location
}