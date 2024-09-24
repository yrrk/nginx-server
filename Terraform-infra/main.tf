resource "azurerm_resource_group" "nginx-project" {
  name     = var.resource-group
  location = var.location
}

resource "azurerm_virtual_network" "nginx-project-vnet" {
  name                = var.vnet
  location            = var.location
  resource_group_name = var.resource-group
  address_space       = ["10.11.0.0/16"]
  depends_on = [
    azurerm_resource_group.nginx-project
  ]
}
resource "azurerm_subnet" "nginx-project-subnet0" {
  name                 = var.subnet0
  resource_group_name  = var.resource-group
  virtual_network_name = var.vnet
  address_prefixes     = ["10.11.0.0/24"]
  depends_on = [
    azurerm_virtual_network.nginx-project-vnet
  ]
}
resource "azurerm_network_security_group" "nginx-project-nsg" {
  name                = "nginx-project-nsg"
  location            = var.location
  resource_group_name = var.resource-group

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  depends_on = [
    azurerm_subnet.nginx-project-subnet0
  ]
}
resource "azurerm_subnet_network_security_group_association" "nginx-project-ngs-vnet" {
  subnet_id                 = azurerm_subnet.nginx-project-subnet0.id
  network_security_group_id = azurerm_network_security_group.nginx-project-nsg.id
  depends_on = [
    azurerm_network_security_group.nginx-project-nsg
  ]
}