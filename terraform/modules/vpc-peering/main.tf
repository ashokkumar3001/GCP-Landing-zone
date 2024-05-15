

resource "google_compute_network_peering" "peering1" {
  name         = "shared-project-peering"
  network      = var.shared-vpc-name
  peer_network = var.service-vpc-name
}

resource "google_compute_network_peering" "peering2" {	
  name         = "service-project-peering"
  network      = var.service-vpc-name
  peer_network = var.shared-vpc-name

}
