data "azurerm_subscription" "main" {
}

resource "azurerm_resource_group" "example" {
  name     = "${var.rg_name}-rg"
  location = var.location
}

data "azurerm_virtual_network" "example" {
  name = var.vnet_name
  resource_group_name = var.vnet_rg
}

data "azurerm_subnet" "example" {
  name = var.vm_subnet_name
  virtual_network_name = data.azurerm_virtual_network.example.name
  resource_group_name  = data.azurerm_virtual_network.example.resource_group_name
}

resource "azurerm_public_ip" "example" {
  name                = "testpip"
  location            = "${azurerm_resource_group.example.location}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "example" {
  name                = "testfirewall"
  location            = "${azurerm_resource_group.example.location}"
  resource_group_name = "${azurerm_resource_group.example.name}"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = "${azurerm_subnet.example.id}"
    public_ip_address_id = "${azurerm_public_ip.example.id}"
  }
}

resource "azurerm_firewall_application_rule_collection" "example" {
  name                = "testcollection"
  azure_firewall_name = "${azurerm_firewall.example.name}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  priority            = 100
  action              = "Allow"

  rule {
    name = "testrule"

    source_addresses = [
      "10.0.0.0/16",
    ]

    target_fqdns = [
      "*.google.com",
    ]

    protocol {
      port = "443"
      type = "Https"
    }
  }
}
