# Creates a managed Kubernetes cluster on Azure.

resource "azurerm_kubernetes_cluster" "cluster" {
    name                = var.app_name
    location            = var.location
    resource_group_name = azurerm_resource_group.iac_example_1.name
    dns_prefix          = var.app_name
    kubernetes_version  = "1.21.7"

    linux_profile {
        admin_username = var.admin_username

        ssh_key {
            key_data = "${trimspace(tls_private_key.key.public_key_openssh)} ${var.admin_username}@azure.com"
        }
    }

    default_node_pool {
        name            = "default"
        node_count      = 1
        vm_size         = "Standard_B2ms"
    }

    service_principal {
        client_id     = var.client_id
        client_secret = var.client_secret
    }
}

// just to output the kubernetes cluster credentials shiiii just for sighting at the terminal

output "cluster_client_key" {
  value =  azurerm_kubernetes_cluster.cluster.kube_config[0].client_key
}

output "cluster_client_certificate" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate
}


output "cluster_cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate
}

output "cluster_username" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].username
}

output "cluster_password" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].password
}

output "cluster_kube_config" {
  value = azurerm_kubernetes_cluster.cluster.kube_config_raw
}

output "cluster_host" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0].host
}

