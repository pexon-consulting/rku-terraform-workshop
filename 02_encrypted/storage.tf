resource "azurerm_storage_account" "my-storage-account" {
  name = "st${replace(local.base_name, "-", "")}enc"
  resource_group_name = azurerm_resource_group.my-resource-group.name
  account_tier = var.account_tier
  location = local.location
  account_replication_type = var.account_replication_type
  identity {
    type = "SystemAssigned"
  }
  lifecycle {
    ignore_changes = [
      customer_managed_key
    ]
  }
}

resource "azurerm_storage_account_customer_managed_key" "encryption-key" {
  storage_account_id = azurerm_storage_account.my-storage-account.id
  key_name = azurerm_key_vault_key.sa-key.name
  key_vault_id = azurerm_key_vault.my-keyvault.id
}

output "storage_identity" {
  value = azurerm_storage_account.my-storage-account.identity
}