
variable "revision" {
  default = 1
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
  #host                   = "https://${data.google_container_cluster.my_cluster.endpoint}"
  host                   = "https://${module.gke.kubernetes_cluster_host}"
  #token                  = data.google_client_config.default.access_token
  token                  = "${module.gke.kubernetes_access_token}"
  #cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
  cluster_ca_certificate = "${module.gke.kubernetes_cluster_cert}"
  #load_config_file       = false
}



# Issue - On destroy , the gke ns deleteion times out !
#resource "kubernetes_namespace" "mendix" {
#  metadata {
#    name = "mendix"
#  }
#}



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
}

/*
resource "helm_release" "mendix_installer" {
  name      = "mendixinstaller"
  chart     = "${path.module}/charts/mendix-installer"
  namespace = "mendix"
  values = [
    templatefile("${path.module}/helm-values/mendix-installer-values.yaml.tpl",
      {
        #cluster_name                 = "${module.gke.kubernetes_cluster_name}"
        cluster_name                 = var.cluster_name
        account_id                   = var.project_id,
        cluster_id                   = "${module.gke.kubernetes_cluster_id}",
        cluster_secret               = sensitive(var.cluster_secret),
        mendix_operator_version      = var.mendix_operator_version,
        aws_region                   = var.location,
        certificate_expiration_email = var.certificate_expiration_email
        registry_pullurl             = google_container_registry.registry.bucket_self_link,
        registry_repository          = var.repository_name,
        registry_iam_role            = "storage.admin",
        ingress_domainname           = var.domain_name,
        environments_internal_names  = var.mendix_env_internal_name
    })
  ]

  depends_on = [module.gke]
}
*/
