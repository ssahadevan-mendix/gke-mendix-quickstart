gcloud container clusters get-credentials $(terraform state show module.gke.google_container_cluster.primary | grep -i name | cut -f2 -d= | tr -d '"' | uniq ) --region $(terraform state show module.gke.data.google_client_config.default | grep -i region | grep -v regions | cut -f2 -d= | tr -d '"' )

kubectl get pods --all-namespaces
