# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}


output "kubernetes_access_token" {
  value       = data.google_client_config.default.access_token
  description = "GKE Cluster access token"
}

output "kubernetes_cluster_cert" {
  value = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
  description = "GKE Cluster cert"
}
