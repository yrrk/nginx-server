output "load-balancer-id" {
  value = azurerm_lb.load-balancer.id
}

output "backend-pool-id" {
  value = azurerm_lb_backend_address_pool.backend_pool.id
}

output "frontend-ip-config-name" {
  value = var.public-ip != null ? "PublicIPAddress" : "PrivateIPAddress"
}