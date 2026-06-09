# Simuleret Azure infrastruktur med bevidste fejlkonfigurationer

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "mini-devsecops-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage" {
  name                     = "minidevsecops"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  allow_nested_items_to_be_public = false
  public_network_access_enabled   = false
  enable_https_traffic_only       = true
  min_tls_version                 = "TLS1_2"
  shared_access_key_enabled       = false


queue_properties {
  logging {
    delete                 = true
    read                   = true
    write                  = true
    version                = "1.0"
    retention_policy_days  = 10
    }
  }

  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }
}

resource "azurerm_mssql_server" "sql" {
  name                         = "mini-devsecops-sql"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "admin"
  administrator_login_password = var.sql_password
  minimum_tls_version          = "1.2"
  public_network_access_enabled = false
}

resource "azurerm_mssql_server_extended_auditing_policy" "audit" {
  server_id                               = azurerm_mssql_server.sql.id
  retention_in_days                       = 91
}

variable "sql_password" {
    description = "SQL administrator password"
    sensitive   = true
}
