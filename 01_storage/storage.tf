resource "azurerm_storage_account" "my-storage-account" {
  name = "st${replace(local.base_name, "-", "")}"
  resource_group_name = azurerm_resource_group.my-resource-group.name
  account_tier = var.account_tier
  location = local.location
  account_replication_type = var.account_replication_type
}