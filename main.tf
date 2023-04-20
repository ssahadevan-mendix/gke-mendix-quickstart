
variable "revision" {
  default = 2
}

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


provider "google" {
  project     = var.project_id
  region      = var.location
}

module "gke" {
  source = "./modules/gke"

  project_id=var.project_id
  region=var.region
}


provider "kubernetes" {
  host                   = "https://${module.gke.kubernetes_cluster_host}"
  token                  = "${module.gke.kubernetes_access_token}"
  cluster_ca_certificate = "${module.gke.kubernetes_cluster_cert}"
  #load_config_file       = false
}


provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.kubernetes_cluster_host}"
    token                  = "${module.gke.kubernetes_access_token}"
    cluster_ca_certificate = "${module.gke.kubernetes_cluster_cert}"
    #load_config_file       = false
  }
}

resource "helm_release" "ingress-ngnix" {
  name  = "ingress-nginx"
  chart = "nginx-stable/nginx-ingress"

  depends_on = [module.gke]
}

resource "google_service_account" "service_account" {
  account_id   = "terraform-account-id"
  display_name = "Service Account"
}

resource "google_container_registry" "registry" {
  project  = var.project_id
  location = var.location
}


resource "null_resource" "configure" {

  triggers = {
    on_version_change = "${var.revision}"
  }

  provisioner "local-exec" {
    command = ". ./do-all.sh 2>&1 | tee tout.txt"
  }
  depends_on = [module.gke]
}
