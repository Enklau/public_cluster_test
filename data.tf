data "azurerm_resource_group" "rg" {
  name = "rg"
}

# cluster users
# data "azuread_user" "user1" {
  # user_principal_name = "user1@example.com"
# }

# data "azuread_user" "user2" {
  # user_principal_name = "user2@example.com"
# }