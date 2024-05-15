resource "google_secret_manager_secret" "secret-basic" {
  project = var.workload-project-name
  secret_id = "TEST_SECRET"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret-version-basic" {
#  project = "service-project1-415010"
  secret = google_secret_manager_secret.secret-basic.id
  secret_data = var.secret-data
}
