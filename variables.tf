variable "location" {
  type    = string
  default = "Westus2"
}

variable "location2" {
  type    = string
  default = "eastus"
}

variable "password" {
  type    = string
  default = ""
}

variable "resource_group_name" {
  type    = string
  default = "rg"
}

variable "on-prem-pip" {
  type      = string
  default   = ""
  sensitive = true
}

variable "shared_key" {
  type    = string
  default = ""
}

variable "bastion_name" {
  type    = string
  default = "bastion"
  validation {
    condition     = can(regex("bastion", var.bastion_name))
    error_message = "not the required value"
  }
}


variable "nestedmap" {
  type = map(map(string))
  default = {
    group1 = {
      key1 = "Westus2"
      key2 = "eastus"
    }
    group2 = {
      key3 = "westus2"
      key4 = "northeurope"
    }
  }
}

variable "enviroment" {
  type = map(string)
}

variable "nameext" {
  type = list(string)
}

variable "list" {
  type = list(string)
}

variable "private_endpoint_name" {
  type = string
}

variable "cluster_name" {
  type    = string
  default = ""
}

variable "db_name" {
  type = string
}

variable "set" {
  type = set(string)
}

variable "containerregistry" {
  type        = string
}

variable "password_cluster" {
  type        = string
  sensitive = true
}
