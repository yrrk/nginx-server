resource "azurerm_network_interface" "nic-card" {
  name                = var.nic-card-name
  location            = var.location
  resource_group_name = var.resource-group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnetid
    private_ip_address_allocation = "Dynamic"
  }
}

# resource "azurerm_linux_virtual_machine" "vm-deployment" {
#   name                            = var.vm-name
#   resource_group_name             = var.resource-group
#   location                        = var.location
#   size                            = "Standard_B1s"
#   admin_username                  = var.username
#   admin_password                  = var.password
#   disable_password_authentication = false
#   network_interface_ids = [
#     azurerm_network_interface.nic-card.id,
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }