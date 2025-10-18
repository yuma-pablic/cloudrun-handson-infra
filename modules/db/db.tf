# resource "google_compute_network" "private_network" {
#   name = "private-network"
# }

# ##既存のVPCを参照するようにする。
# resource "google_compute_global_address" "private_ip_address" {
#   name          = "cnsrn-cnsrun-private-ip-address"
#   purpose       = "VPC_PEERING"
#   address_type  = "INTERNAL"
#   prefix_length = 24
#   address       = "10.0.200.0"
#   network       = google_compute_network.private_network.id
# }

# ##既存のVPCを参照するようにする。
# resource "google_service_networking_connection" "private_vpc_connection" {
#   network                 = google_compute_network.private_network.id
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
# }

# resource "google_sql_database_instance" "instance" {
#   name             = "cnsrun-app-instance"
#   region           = "asia-northeast1"
#   database_version = "POSTGRES_15"

#   depends_on = [google_service_networking_connection.private_vpc_connection]

#   settings {
#     tier = "db-f1-micro"
#     edition = "ENTERPRISE_PLUS"
#     ip_configuration {
#       ipv4_enabled                                  = false
#       private_network                               = google_compute_network.private_network.self_link
#       enable_private_path_for_google_cloud_services = true
#     }
#   }
# }


# resource "google_sql_user" "users" {
#   name     = "me"
#   instance = google_sql_database_instance.instance.name
#   host     = "me.com"
#   password = "Cnsrun-db-pass-1234"
# }