data "azurerm_subscription" "main" {
}

data "azurerm_resource_group" "main" {
  name = "gso_splunk_rg"
}
