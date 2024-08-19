resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.1.0.0/16"]
  location            = var.location2
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "v-node-subnet" {
  name                 = "v-node-subnet"
  virtual_network_name = azurerm_virtual_network.example.name
  resource_group_name  = data.azurerm_resource_group.rg.name
  address_prefixes     = ["10.1.0.0/24"]   # subnet within the service vnet for virtual nodes

#  This tells Azure which services are allowed to use the subnet.
  delegation {
    name = "delegation"
    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }


  depends_on = [ 
    data.azurerm_resource_group.rg,
    azurerm_virtual_network.example
  ]
}

 
resource "azurerm_subnet" "default" {
  name                 = "default"
  virtual_network_name = azurerm_virtual_network.example.name
  resource_group_name  = data.azurerm_resource_group.rg.name
  address_prefixes     = ["10.1.2.0/24"]
depends_on = [
  azurerm_virtual_network.example
]
}