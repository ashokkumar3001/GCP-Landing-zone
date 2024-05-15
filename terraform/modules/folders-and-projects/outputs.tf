output "network-project-name" {
  value  = google_project.my_project-in-Network-folder.project_id

}

output "workload-project-name" {
  value  = google_project.my_project-in-workload-folder.project_id
}
