
resource "google_cloudbuildv2_connection" "my_connection" {
  project  = var.project_id
  location = var.region
  name     = "${var.environment}-cloudrun-handson-infra"

  github_config {
    app_installation_id = "87705649"
    authorizer_credential {
      oauth_token_secret_version = data.google_secret_manager_secret_version.github_token_version.id
    }
  }
}

resource "google_cloudbuildv2_repository" "cnsrun_app_repo" {
  project           = var.project_id
  location          = var.region
  name              = "${var.environment}-cnsrun-app"
  parent_connection = google_cloudbuildv2_connection.my_connection.id
  remote_uri        = "https://github.com/yuma-pablic/cloudrun-handson.git"
}