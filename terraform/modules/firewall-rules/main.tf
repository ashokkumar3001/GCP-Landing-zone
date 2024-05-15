## allow internet access to the vm's after cloud NAT creation.

resource "google_compute_firewall" "default" {
  name    = "allow-iap-test"
  project = var.network-project-name
  network = var.shared-network-name
  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

  source_ranges = ["35.235.240.0/20"]
  priority = "1000"
  
}

## Allow ingress access for the compute instances

resource "google_compute_firewall" "ingress" {
  name    = "test-firewall-ingress"
  project = var.network-project-name
  network = var.shared-network-name
  
  allow {
    protocol = "all" 
  } 

  source_ranges = ["10.150.0.0/20"]
    priority = "1000"

}
