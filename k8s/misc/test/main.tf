provider "kubernetes" {
  config_path = "~/.kube/config"
}

terraform {
  required_providers {
    kustomization = {
      source  = "kbst/kustomization"
      version = "0.8.2"
    }
  }
  required_version = ">= 0.12"
}
provider "kustomization" {
  kubeconfig_path = "~/.kube/config"
}

data "kustomization" "main" {
  provider = kustomization
  path = "./"
}

resource "kustomization_resource" "main" {
  provider = kustomization
  for_each = data.kustomization.main.ids
  manifest = data.kustomization.main.manifests[each.value]
}