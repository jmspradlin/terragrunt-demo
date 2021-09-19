provider "azurerm" {
  features {}
}
# Variables with Defaults
variable "region" {
    default = "eastus2"
}
variable "account_tier" {
    default = "Standard"
}

#Terragrunt variables
variable "account_replication_type" {}
variable "env" {}

resource "azurerm_resource_group" "rg01" {
    name = "rg-${var.env}01"
    location = var.region
}

resource "azurerm_storage_account" "stor01" {
    name                      = "stor${lower(var.env)}01"
    location                  = azurerm_resource_group.rg01.location
    resource_group_name       = azurerm_resource_group.rg01.name
    account_tier              = var.account_tier
    account_replication_type  = upper(var.account_replication_type)
}