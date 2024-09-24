variable "nic-card-name" {
  type        = string
  description = "name of the nic"
}
variable "resource-group" {
  type        = string
  description = "Resource Group to be used for vm"
}
variable "location" {
  type        = string
  description = "Location to be used for the vm"
}
variable "subnetid" {
  type        = string
  description = "Subnet ID if attaching it to a subnet"
}
variable "vm-name" {
  type        = string
  description = "name of the VM"
}
variable "username" {
  type        = string
  description = "Admin Username to login to the VM"
}
variable "password" {
  type        = string
  description = "Admin Password to login to the vm"
}