output "vpc_self_link" {
  description = "The self link of the VPC network"
  value       = google_compute_network.vpc.self_link
}

output "private_vpc_connection_network" {
  description = "The network of the VPC peering connection"
  value       = google_service_networking_connection.private_vpc_connection.network
}
