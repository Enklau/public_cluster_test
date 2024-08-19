# generic variables

location  = "Westus"
location2 = "eastus2"


nestedmap = {
  group1 = {
    key1 = "eastus"
    key2 = "westus"
  }

  group2 = {
    key3 = "westus2"
    key4 = "northeurope"
  }
}

# resource-specific variables

password              = "318361Nacho/"
password_cluster              = "318361Nacho/123"
on-prem-pip           = "91.126.43.232"
shared_key            = "318361Nacho/"
bastion_name          = "bastion"
private_endpoint_name = "private-endpoint-1"
cluster_name          = "cluster"
db_name               = "db"
enviroment = {
  key1        = "production"
  key2        = "pre-production"
  key3        = "test-env"
  Environment = "Development"
}
set = ["DNS Zone Contributor", "Network Contributor","Owner"]
containerregistry = "containerregistry"

nameext = ["extension1", "extension2"]
list    = ["1", "2"]