resource "google_compute_router" "router" {
  project = var.network-project-name
  name    = "mytest-router"
  region  = "us-central1"
  network = var.shared-network-name

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat" {
  project                            = var.network-project-name
  name                               = "my-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
     enable = true
    filter = "ERRORS_ONLY"
  }
}
