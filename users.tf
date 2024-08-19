# cluster users group
resource "azuread_group" "example_group" {
  display_name     = "ExampleGroup"
  security_enabled = true
}

# resource "azuread_group_member" "user1_group_member" {
#   group_object_id  = azuread_group.example_group.id
#   member_object_id = data.azuread_user.user1.id
# }

# resource "azuread_group_member" "user2_group_member" {
#   group_object_id  = azuread_group.example_group.id
#   member_object_id = data.azuread_user.user2.id
# }


