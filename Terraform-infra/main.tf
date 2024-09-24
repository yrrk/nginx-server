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
module "nginx-project-vm" {
  source         = "./modules/virtual-machine"
  for_each       = var.vms
  nic-card-name  = "nginx-project-${each.key}-nic"
  resource-group = var.resource-group
  location       = var.location
  subnetid       = azurerm_subnet.nginx-project-subnet0.id
  vm-name        = "nginx-project-${each.key}"
  username       = "adminuser"
  password       = "P@ssw0rd123!"
  depends_on = [
    azurerm_subnet_network_security_group_association.nginx-project-ngs-vnet
  ]
}

locals {
  network_interfaces = {
    for idx, nic_id in module.nginx-project-vm : idx => {
      id                    = nic_id.nic_card_ids
      ip_configuration_name = "internal"
    }
  }
  depends_on = [
    module.nginx-project-vm
  ]
}
output "network_interfaces_output" {
  value = local.network_interfaces
}
module "nginx-project-lb0" {
  source         = "./modules/load-balancer"
  resource-group = var.resource-group
  location       = var.location
  lb-name        = "nginx-project-lb0"
  create_publicfrontend_ip = true
  create_privatefrontend_ip = false
  subnetid       = azurerm_subnet.nginx-project-subnet0.id
  depends_on = [
    module.nginx-project-vm
  ]
  network-interfaces = local.network_interfaces
}

resource "azurerm_lb_probe" "nginx-project-lb-probe" {
  name                = "nginx-project-lb-probe"
  loadbalancer_id     = module.nginx-project-lb0.load-balancer-id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
  depends_on = [
    module.nginx-project-lb0
  ]
}
resource "azurerm_lb_rule" "nginx-project-lb-rule" {
  name                           = "nginx-project-lb-rule"
  loadbalancer_id                = module.nginx-project-lb0.load-balancer-id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = module.nginx-project-lb0.frontend-ip-config-name
  probe_id                       = azurerm_lb_probe.nginx-project-lb-probe.id
  backend_address_pool_ids       = [module.nginx-project-lb0.backend-pool-id]
  depends_on = [
    azurerm_lb_probe.nginx-project-lb-probe
  ]
}

resource "azurerm_lb_nat_rule" "ssh_nat_rule_vm1" {
  name                           = "ssh_nat-rule-vm1"
  resource_group_name            = var.resource-group
  loadbalancer_id                = module.nginx-project-lb0.load-balancer-id
  backend_port                   = 22          # Default SSH port on the VM
  frontend_port                  = 2389        # Custom port for accessing VM1
  protocol                       = "Tcp"
  frontend_ip_configuration_name  = module.nginx-project-lb0.frontend-ip-config-name
  idle_timeout_in_minutes        = 4
  depends_on=[
    azurerm_lb_rule.nginx-project-lb-rule
  ]
}

resource "azurerm_lb_nat_rule" "ssh_nat_rule_vm2" {
  name                           = "ssh_nat_rule_vm2"
  resource_group_name            = var.resource-group
  loadbalancer_id                = module.nginx-project-lb0.load-balancer-id
  backend_port                   = 22          # Default SSH port on the VM
  frontend_port                  = 2390        # Custom port for accessing VM2
  protocol                       = "Tcp"
  frontend_ip_configuration_name  = module.nginx-project-lb0.frontend-ip-config-name
  idle_timeout_in_minutes        = 4
  depends_on=[
    azurerm_lb_rule.nginx-project-lb-rule
  ]
}