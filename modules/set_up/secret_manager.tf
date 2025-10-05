data "google_secret_manager_secret" "github_token" {
  secret_id = "github"
}

data "google_secret_manager_secret_version" "github_token_version" {
  project = var.project_id
  secret  = data.google_secret_manager_secret.github_token.id
  version = "latest"
}