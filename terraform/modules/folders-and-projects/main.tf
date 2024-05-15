resource "google_folder" "networking" {
  display_name = var.network-folder
  parent       = "organizations/714534223152"
}

resource "google_folder" "workloads" {
  display_name = var.workload_folder
  parent       = "organizations/714534223152"
}

# Folder nested under another folder.
resource "google_folder" "development" {
  display_name = var.sub_folder
  parent       = google_folder.workloads.name
}


data "google_billing_account" "default" {
  billing_account = "017C77-7CB6FF-FE9DFD"
}


resource "google_project" "my_project-in-workload-folder" {
  name       = "dev project"
  project_id = var.dev_project_id
  folder_id  = google_folder.development.name
  billing_account = data.google_billing_account.default.billing_account
}

resource "google_project" "my_project-in-Network-folder" {
  name       = "network project"
  project_id = var.network_project_id
  folder_id  = google_folder.networking.name
  billing_account = data.google_billing_account.default.billing_account
}
