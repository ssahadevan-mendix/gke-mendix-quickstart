
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

variable "domain_name" {
  type = string
  default="ssdemo.com"
}

variable "repository_name" {
  type = string
  default="mendix"
}

variable "mendix_operator_version" {
  type = string
  default="2.10.1"
}

variable "mendix_env_internal_name" {
  type = list(string)
  default=["demoapp"]
}

variable "cluster_secret" {
  type = string
  default="mendix"
}

variable "certificate_expiration_email" {
  type = string
  default="sharath.sahadevan@mendix.com"
}

variable "cluster_name" {
  type = string
  default="ss-test-demo-gke"
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



# Issue - On destroy , the gke ns deleteion times out !
#resource "kubernetes_namespace" "mendix" {
#  metadata {
#    name = "mendix"
#  }
#}


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


resource "null_resource" "example" {
  # On success, this will attempt to execute the true command in the
  # shell environment running terraform.
  # On failure, this will attempt to execute the false command in the
  # shell environment running terraform.

  triggers = {
    on_version_change = "${var.revision}"
  }

  provisioner "local-exec" {
    command = ". ./do-all.sh > tout.txt"
  }
  depends_on = [module.gke]
}



