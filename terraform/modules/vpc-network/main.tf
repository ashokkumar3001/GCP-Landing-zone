resource "google_compute_network" "vpc" {
  project       = var.network-project-name
  name          = var.shared-network-name
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  project       = var.network-project-name
  name          = var.shared-subnet-name
  region        = "us-east4"
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

resource "google_compute_network" "vpc2" {
  project       = var.workload-project-name
  name          = var.service-network-name
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet2" {
  project       = var.workload-project-name
  name          = var.service-subnet-name
  region        = "us-east4"
  network       = google_compute_network.vpc2.name
  ip_cidr_range = "10.2.0.0/16"
}

