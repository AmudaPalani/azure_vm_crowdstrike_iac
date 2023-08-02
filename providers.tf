terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "=3.25.0"
        }
    }
}  

provider "azurerm" {
  tenant_id                  = var.tenant_id
  subscription_id            = var.subscription_id
  client_id                  = var.client_id
  client_secret              = var.client_secret
  skip_provider_registration = true
  features {}
}
