resource "google_secret_manager_secret" "db_password" {
  secret_id = local.db_password_secret

  replication {
    user_managed {
      replicas {
        location = "asia-northeast1"
      }
    }
  }
}

resource "google_secret_manager_secret_version" "db_password" {
  secret = google_secret_manager_secret.db_password.id

  secret_data = "pMYvcTME?_N@#<Z4"
}
