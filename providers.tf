data "azurerm_subscription" "current" {
  subscription_id = var.subscription_id
}

provider "azurerm" {
  #Pin the version
  #See https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md for latest version
  version = ">=3.20.0"

  tenant_id                  = var.tenant_id
  subscription_id            = var.subscription_id
  client_id                  = var.client_id
  client_secret              = var.client_secret
  skip_provider_registration = true
  features {}
}
