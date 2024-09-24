resource "azurerm_public_ip" "public-ip" {
  count               = var.create_publicfrontend_ip ? 1 : 0
  name                = "public-ip1"
  resource_group_name = var.resource-group
  location            = var.location
  allocation_method   = "Static"
}
resource "azurerm_lb" "load-balancer" {
  name                = var.lb-name
  location            = var.location
  resource_group_name = var.resource-group
  dynamic "frontend_ip_configuration" {
    for_each = var.create_publicfrontend_ip ? [1] : []

    content {
      name                 = "PublicIPAddress"
      public_ip_address_id = azurerm_public_ip.public-ip.id
    }
  }
  dynamic "frontend_ip_configuration" {
    for_each = var.create_privatefrontend_ip ? [1] : []
    content{
    name      = "PrivateIPAddress"
    subnet_id = var.subnetid
    }
  }
}
resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.load-balancer.id
  name            = "BackEndAddressPool"
  depends_on = [
    azurerm_lb.load-balancer
  ]
}
resource "azurerm_network_interface_backend_address_pool_association" "NICtoBackendpool" {
  for_each                = var.network-interfaces
  network_interface_id    = each.value.id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
  depends_on = [
    azurerm_lb_backend_address_pool.backend_pool
  ]
}