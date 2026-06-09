# Simuleret Azure infrastruktur med bevidste fejlkonfigurationer

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "mini-devsecops-rg"
  location = "West Europe"
}

# FEJL 1: Storage account med offentlig adgang og ingen HTTPS
resource "azurerm_storage_account" "storage" {
  name                     = "minidevsecops"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public = true
  enable_https_traffic_only       = false
}

# FEJL 2: SQL server med hardkodet password
resource "azurerm_mssql_server" "sql" {
  name                         = "mini-devsecops-sql"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "admin"
  administrator_login_password = "password123"
}

# FEJL 3: Firewall regel der åbner databasen for hele internettet
resource "azurerm_mssql_firewall_rule" "allow_all" {
  name             = "allow-all"
  server_id        = azurerm_mssql_server.sql.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}