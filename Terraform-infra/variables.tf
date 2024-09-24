variable "resource-group" {
  type        = string
  default     = "nginx-project"
  description = "Name of the resource group"
}
variable "location" {
  type        = string
  default     = "East US"
  description = "Location of the infra"
}
variable "vnet" {
  type        = string
  default     = "nginx-project-vnet"
  description = "name of the vnet"
}
variable "subnet0" {
  type        = string
  default     = "nginx-project-subnet0"
  description = "name of the subnet"
}


