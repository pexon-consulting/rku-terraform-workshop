data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "my-keyvault" {
  name = "kv-${local.base_name}-encrypted"
  resource_group_name = azurerm_resource_group.my-resource-group.name
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = var.sku_name
  location = local.location
  purge_protection_enabled = true
  soft_delete_retention_days = 7
}

resource "azurerm_key_vault_access_policy" "storage" {
  tenant_id = data.azurerm_client_config.current.tenant_id
  key_vault_id = azurerm_key_vault.my-keyvault.id
  key_permissions = [
    "Get",
    "WrapKey",
    "UnwrapKey"
  ]
  object_id = azurerm_storage_account.my-storage-account.identity[0].principal_id
}


resource "azurerm_key_vault_access_policy" "client" {
  key_vault_id = azurerm_key_vault.my-keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = ["Get"]
  key_permissions = [
    "Get",
    "Create",
    "Delete",
    "List",
    "Restore",
    "Recover",
    "UnwrapKey",
    "WrapKey",
    "Purge",
    "Encrypt",
    "Decrypt",
    "Sign",
    "Verify",
    "GetRotationPolicy",
    "SetRotationPolicy"
  ]
}

resource "azurerm_key_vault_key" "sa-key" {
  name = "key-${local.base_name}-sa-encryption"
  key_type = "RSA"
  key_size = 4096
  key_vault_id = azurerm_key_vault.my-keyvault.id
  key_opts = []
  depends_on = [ 
    azurerm_key_vault_access_policy.client,
    azurerm_key_vault_access_policy.storage
  ]
}