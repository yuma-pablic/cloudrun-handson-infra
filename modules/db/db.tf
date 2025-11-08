resource "google_sql_database_instance" "instance" {
  name                = local.instance_name
  region              = "asia-northeast1"
  database_version    = "POSTGRES_15"
  deletion_protection = false

  depends_on = [var.private_vpc_connection_network]

  settings {
    tier              = "db-f1-micro"
    edition           = "ENTERPRISE"
    availability_type = "ZONAL"
    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = var.vpc_self_link
      enable_private_path_for_google_cloud_services = true
    }
  }
}


resource "google_sql_user" "users" {
  name     = "app"
  instance = google_sql_database_instance.instance.name
  password = "pMYvcTME?_N@#<Z4"
}

resource "google_sql_database" "app_db" {
  name     = local.database_name
  instance = google_sql_database_instance.instance.name
}
