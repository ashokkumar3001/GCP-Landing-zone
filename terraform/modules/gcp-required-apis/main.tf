variable "gcp_service_list1" {
  description ="The list of apis necessary for the project"
  type = list(string)
  default = [
    "serviceusage.googleapis.com",
    "secretmanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "cloudbilling.googleapis.com",
    "logging.googleapis.com"
  ]
}

resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list1)
  project = var.network-project-name
  service = each.key

  disable_dependent_services = true
}

variable "gcp_service_list2" {
  description ="The list of apis necessary for the project"
  type = list(string)
  default = [
    "serviceusage.googleapis.com",
    "secretmanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "cloudbilling.googleapis.com",
    "logging.googleapis.com"
  ]
}

resource "google_project_service" "gcp_services2" {
  for_each = toset(var.gcp_service_list2)
  project = var.workload-project-name
  service = each.key

  disable_dependent_services = true
}

