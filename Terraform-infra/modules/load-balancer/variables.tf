variable "resource-group" {
  type        = string
  description = "Resource Group to be used for load-balancer"
}
variable "location" {
  type        = string
  description = "Location to be used for the load-balancer"
}
variable "lb-name" {
  type        = string
  description = "name of the load-balancer"
}
variable "public-ip" {
  type        = string
  default     = null
  description = "Public IP needed to be attached to load balancer"
}
variable "subnetid" {
  type        = string
  description = "Subnet ID if attaching it to a subnet"
}
variable "create_publicfrontend_ip" {
  description = "Boolean to control the creation of public frontend IP configuration"
  type        = bool
  default     = false
}
variable "create_privatefrontend_ip" {
  type        = bool
  default     = true
  description = "Boolean to control the creation of private frontend IP configuration"
}
variable "network-interfaces" {
  type = map(object({
    id                    = string
    ip_configuration_name = string
  }))
  description = "NIC ids of the resources"
}