resource "google_compute_network" "vpc" {
  name                    = "test-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "test-subnet"
  region        = "us-east4"
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}


data "google_container_engine_versions" "gke_version" {
  location = "us-east4"
  version_prefix = "1.27."
}

resource "google_container_cluster" "primary" {
  name     = "test-gke"
  location = "us-east4"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.primary.name
  location   = "us-east4"
  cluster    = google_container_cluster.primary.name
  
  version = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]
  node_count = "1"

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]


    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
