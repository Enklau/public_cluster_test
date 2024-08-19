# cluster
resource "azurerm_kubernetes_cluster" "example" {
  name                = local.aks_cluster_name
  location            = var.location2
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "exampleaks"
  http_application_routing_enabled = false
  azure_policy_enabled = true

  default_node_pool { 
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
    vnet_subnet_id = azurerm_subnet.default.id
   }

  # aci_connector_linux {
  #   subnet_name = azurerm_subnet.v-node-subnet.name
  # }

  # azure_active_directory_role_based_access_control {
  #   managed                = true
  #   admin_group_object_ids = [azuread_group.example_group.id]  
  # }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  auto_scaler_profile {
    balance_similar_node_groups       = true
    expander                          = "least-waste"   
    max_graceful_termination_sec      = 600
    scale_down_delay_after_add        = "10m"
    scale_down_delay_after_failure    = "3m"
    scale_down_unneeded               = "10m"
    scale_down_unready                = "20m"
    scale_down_utilization_threshold  = 0.5
    scan_interval                     = "10s"
    new_pod_scale_up_delay            = "0s"
    skip_nodes_with_local_storage     = false
    skip_nodes_with_system_pods       = false
  }

  windows_profile {
    admin_username = "enklau"
    admin_password = var.password_cluster
  }

  oms_agent {
    log_analytics_workspace_id = "/subscriptions/c19d7631-6513-47a9-853a-70d1fe3ee746/resourceGroups/rg/providers/Microsoft.OperationalInsights/workspaces/example-workspace"
  }

  identity {
    type = "SystemAssigned"
  }
  

  tags = { for key, value in var.enviroment : key => value if strcontains(key, "env") }


  depends_on = [
    azurerm_virtual_network.example,
    azurerm_subnet.v-node-subnet
  ]
}

# win cluster pool
# resource "azurerm_kubernetes_cluster_node_pool" "example" {
#   name                  = "pool1"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.example.id
#   vm_size               = "Standard_B2as_v2"
#   node_count            = 1
#   os_type               = "Windows"
#   os_disk_size_gb       = 35

#   enable_auto_scaling = true
#   min_count           = 1
#   max_count           = 2

#   priority        = "Spot"
#   eviction_policy = "Delete"
#   spot_max_price  = -1


#     tags = { for key, value in var.enviroment : key => value if strcontains(key, "env") }
# }

# role assignments
resource "azurerm_role_assignment" "role_definition" {
  principal_id     = azurerm_kubernetes_cluster.example.identity[0].principal_id
  role_definition_name = element(tolist(var.set), 1)
  scope                = azurerm_dns_zone.example-public.id
}

resource "azurerm_role_assignment" "role_definition3" {
  principal_id     = azurerm_kubernetes_cluster.example.identity[0].principal_id
  role_definition_name = element(tolist(var.set), 3)
  scope                = "/subscriptions/c19d7631-6513-47a9-853a-70d1fe3ee746"
}

# dns zone
resource "azurerm_dns_zone" "example-public" {
  name                = "enklau15.es"
  resource_group_name = data.azurerm_resource_group.rg.name
}

# container registry
resource "azurerm_container_registry" "acr" {
  name                = local.acr_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = false
}


