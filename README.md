# Terraform Workshop

Dieses Repository enthält Beispiellösungen für einen Terraform-Workshop.

## 1. Anlegen eines Storage Account

Pfad: `01_storage`

In diesem Minimalbeispiel werden neben der Providerkonfiguration lediglich eine Resource Group und ein Storage Account angelegt.

## 2. Storage Account mit CMK Verschlüsselung

Pfad: `02_encrypted`

Im Vergleich zum ersten Beispiel muss hier zusätzlich ein Key Vault mit korrekten Berechtigungen sowie ein Key angelegt werden. Der Storage Account benötigt zusätzlich eine Managed Identity. Die Verschlüsselung wird in Terraform durch eine speuzielle Resource abgebildet.

## 3. Anlegen einer Linux-VM

Pfad: `03_vm`

Eines der Microsoft Learn Beispiele. Vorlage: https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform