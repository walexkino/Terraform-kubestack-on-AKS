# Sets global variables for this Terraform project.

// also note that those empty variables makes the terraform ask you to put in their input the advantage of this is that when you puy
//in different app name then a new aks and acr name is created with resource grp name inside that subscription 

variable app_name {
}

variable location {
  default = "West US"
}

variable admin_username {
  default = "linux_admin"
}

variable client_id {

}

variable client_secret {

}



//setting the variables for the kubernetes cred. like host etc

/* variable cluster_client_key {
  default = azurerm_kubernetes_cluster.cluster.kube_config[0].client_key
}

variable cluster_client_certificate{
  default = azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate
}

variable cluster_cluster_ca_certificate {
  default = azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate

}

variable cluster_username {
  default = azurerm_kubernetes_cluster.cluster.kube_config[0].username
}

variable cluster_password {
  default = azurerm_kubernetes_cluster.cluster.kube_config[0].password
}

variable cluster_kube_config {
  default = azurerm_kubernetes_cluster.cluster.kube_config_raw
}

variable cluster_host {
  default = azurerm_kubernetes_cluster.cluster.kube_config[0].host
} */


variable "kube_config" {
  
  type = string

  default = "~/.kube/config"
}

//defining for the k8s namespace

 variable "namespace" {
  type    = string
  default = "default"
} 