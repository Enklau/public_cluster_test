resource "azurerm_log_analytics_workspace" "example-workspace" {
  name                = "example-workspace"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = "PerGB2018"

  retention_in_days = 30

  tags = { for key, value in var.enviroment : key => value if strcontains(key, "env") }

  daily_quota_gb = 1
}