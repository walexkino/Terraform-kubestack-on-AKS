# Initialises Terraform providers and sets their version numbers.

provider "azurerm" {
    version = "1.38.0"
}

provider "tls" {
    version = "2.1.0"
}


// defining the helm credentials etc


provider "helm" {
  
kubernetes {


     host = azurerm_kubernetes_cluster.cluster.kube_config[0].host
     cluster_ca_certificate = azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate
     client_certificate = azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate
     client_key = azurerm_kubernetes_cluster.cluster.kube_config[0].client_key

     config_path =   azurerm_kubernetes_cluster.cluster.kube_config_raw
   // config_path = "~/.kube/config"  // specifying the kubeconfig path file

   // config_context = var.app_name  // if this is not specified then it chooses the default cluster but we want it to deploy in 
                                    // the cluster that it just recently created on the fly -- testing to see if it works 

}

}


