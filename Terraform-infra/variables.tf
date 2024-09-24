variable "resource-group" {
  type        = string
  default     = "nginx-project"
  description = "Name of the resource group"
}
variable "location" {
  type        = string
  default     = "Canada Central"
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

variable "vms" {
  description = "Map of VM configurations"
  type = map(object({
    name           = string
    admin_username = string
    admin_password = string
  }))
  default = {
    vm1 = {
      name           = "nginx-project-vm0"
      admin_username = "adminuser"
      admin_password = "P@ssw0rd123!"
    }
    vm2 = {
      name           = "nginx-project-vm1"
      admin_username = "adminuser"
      admin_password = "P@ssw0rd123!"
    }
  }
}

