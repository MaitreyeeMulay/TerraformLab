resource "azurerm_resource_group" "rgtest" {
  name     = "rgtest"
  location = "west us"

}

resource "azurerm_virtual_network" "test-vnet" {
  name                = "test-vnet"
  location            = azurerm_resource_group.rgtest.location
  resource_group_name = azurerm_resource_group.rgtest.name
  address_space       = ["172.30.0.0/16"]
  dns_servers         = ["172.30.0.4", "172.30.0.5"]

  tags = {
    environment = "prod"
  }
depends_on = [ azurerm_resource_group.rgtest ]  #meta argument to create deendency
}

resource "azurerm_subnet" "prod-subnet" {
  name  = "prod-subnet"
  resource_group_name  = azurerm_resource_group.rgtest.name
  virtual_network_name = azurerm_virtual_network.test-vnet.name
  address_prefixes     = ["172.30.1.0/24"]

  depends_on = [ azurerm_virtual_network.test-vnet ]
}

resource "azurerm_subnet" "dev-subnet" {
  name                 = "dev-subnet"
  resource_group_name  = azurerm_resource_group.rgtest.name
  virtual_network_name = azurerm_virtual_network.test-vnet.name
  address_prefixes     = ["172.30.2.0/24"]

  depends_on = [ azurerm_virtual_network.test-vnet ]
}

resource "azurerm_network_security_group" "test1" {

  name                = "test1-security-group"
  location            = azurerm_resource_group.rgtest.location
  resource_group_name = azurerm_resource_group.rgtest.name
 depends_on = [ azurerm_subnet.prod-subnet , azurerm_subnet.dev-subnet ]


}
 