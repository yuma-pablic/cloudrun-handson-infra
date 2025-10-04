##TODO削除
data "google_secret_manager_secret" "sample-secret" {
  secret_id = "github"
}

data "google_secret_manager_secret_version" "sample-version" {
  project = "cloudrun-hands-on-473403"
  secret  = data.google_secret_manager_secret.sample-secret.id
  version = "latest"
}
