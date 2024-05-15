resource "google_service_account" "default" {
  account_id   = "test-service-account2"
  project = var.workload-project-name
  display_name = "Custom SA for VM Instance"
}

resource "google_compute_instance" "default" {
  project      = var.workload-project-name
  name         = "mytest-instance2"
  machine_type = "n1-standard-1"
  zone         = "us-east4-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = var.shared-vpc-name
    subnetwork = var.shared-vpc-subnet
  }

  service_account {
#    email  = "786920786517-compute@developer.gserviceaccount.com"
    email = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
