
variable "project_id" {
  type = string
  default="ss-test-demo"
}

variable "region" {
  type = string
  default="us-central1"
}

variable "location" {
  type = string
  default="us"
}

module "gke" {
  source = "./modules/gke"

  project_id=var.project_id
  region=var.region
}


provider "kubernetes" {
  #host                   = "https://${data.google_container_cluster.my_cluster.endpoint}"
  host                   = "https://${module.gke.kubernetes_cluster_host}"
  #token                  = data.google_client_config.default.access_token
  token                  = "${module.gke.kubernetes_access_token}"
  #cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
  cluster_ca_certificate = "${module.gke.kubernetes_cluster_cert}"
}



#resource "kubernetes_namespace" "mendix" {
#  metadata {
#    name = "mendix"
#  }
#}


resource "google_container_registry" "registry" {
  project  = var.project_id
  location = var.location
}
