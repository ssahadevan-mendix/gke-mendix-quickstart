module "gke" {
  source = "./modules/gke"

  project_id="ss-test-demo"
  region="us-central1"
}
