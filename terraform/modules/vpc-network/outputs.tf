output "shared-network-name" {
  value       = google_compute_network.vpc.name
  description = "The name of the VPC being created"
}

output "shared-subnet-name" {
  value       = google_compute_subnetwork.subnet.name
  description = "The name of the shared subnet being created"
}

output "service-network-name" {
  value       = google_compute_network.vpc2.name
  description = "The name of the service VPC being created"
}

output "service-subnet-name" {
  value       = google_compute_subnetwork.subnet2.name
  description = "The name of the service subnet being created"
}

output "shared-network-id" {
  value       = google_compute_network.vpc.id
  description = "The name of the VPC being created"
}

output "shared-vpc-name" { 
  value       = google_compute_network.vpc.self_link

}

output "service-vpc-name" {
  value       = google_compute_network.vpc2.self_link
}

output "shared-vpc-subnet" {
  value       = google_compute_subnetwork.subnet.self_link

}

