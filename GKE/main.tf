provider "google" {
  credentials = file("<path_to_your_service_account_key_file>")
  project     = "<your_project_id>"
  region      = "<your_preferred_region>"
}

resource "google_container_cluster" "my_cluster" {
  name     = "my-cluster"
  location = "<your_preferred_zone>"

  # Configure the cluster
  initial_node_count = 3
  node_version       = "1.20.9"

  # Configure the default node pool
  node_pool {
    name            = "default-pool"
    machine_type    = "n1-standard-2"
    disk_size_gb    = 100
    disk_type       = "pd-standard"
    min_count       = 1
    max_count       = 5
    initial_node_count = 3
  }

  # Enable auto-upgrade for the nodes
  autoupgrade = true

  # Enable automatic repair for the nodes
  auto_repair = true
}

output "cluster_endpoint" {
  value = google_container_cluster.my_cluster.endpoint
}

output "cluster_master_auth" {
  value = google_container_cluster.my_cluster.master_auth
}
