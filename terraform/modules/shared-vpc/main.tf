#resource "google_project" "my_project" {
#  name       = "My host Project"
#  project_id = var.host-project-id
#  org_id     = "714534223152"
#}



# A Host project which shares the resources with the service project.

resource "google_compute_shared_vpc_host_project" "host" {
  project = var.network-project-name
}

# A service project gains access to network resources provided by its
# associated host project.
resource "google_compute_shared_vpc_service_project" "service1" {
  host_project    = google_compute_shared_vpc_host_project.host.project
  service_project = var.workload-project-name
}

/*resource "google_compute_shared_vpc_service_project" "service2" {
  host_project    = google_compute_shared_vpc_host_project.host.project
  service_project = "var.service-project-id-2"
}*/
