
locals {
  # resuorce names
  resource_group_name   = data.azurerm_resource_group.rg.name
  location              = "Westus2"
  bastion_name          = "${terraform.workspace}-${lookup(var.nestedmap["group1"], "key2")}-${lookup(var.enviroment, "key1")}-${var.bastion_name}"
  extension-first-name  = "${terraform.workspace}-${lookup(var.enviroment, "key1")}-${element(var.nameext, length(var.nameext) - 2)}"
  private_endpoint_name = "${terraform.workspace}-${lookup(var.enviroment, "key1")}-${var.private_endpoint_name}"
  aks_cluster_name      = "${terraform.workspace}-${lookup(var.enviroment, "key1")}-${var.cluster_name}"
  sql_name              = "${terraform.workspace}-${lookup(var.enviroment, "key1")}-${var.db_name}"
  acr_name              = "${terraform.workspace}${lookup(var.enviroment, "key1")}${var.containerregistry}"
}