resource "google_secret_manager_secret_iam_member" "policy" {
  project   = data.google_secret_manager_secret.github_token.project
  secret_id = data.google_secret_manager_secret.github_token.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = google_service_account.cnsrun_app_cloud_build.member
}

resource "google_secret_manager_secret_iam_member" "cloud_build" {
  project   = data.google_secret_manager_secret.github_token.project
  secret_id = data.google_secret_manager_secret.github_token.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:service-412410043737@gcp-sa-cloudbuild.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "cloud_build" {
  member  = google_service_account.cnsrun_app_cloud_build.member
  project = var.project_id
  role    = "roles/cloudbuild.builds.builder"
}

resource "google_project_iam_member" "cloud_logging" {
  member  = google_service_account.cnsrun_app_cloud_build.member
  project = var.project_id
  role    = "roles/logging.logWriter"
}

resource "google_project_iam_member" "cloud_deploy" {
  member  = google_service_account.cnsrun_app_cloud_build.member
  project = var.project_id
  role    = "roles/clouddeploy.releaser"
}

resource "google_project_iam_member" "service_account" {
  member  = google_service_account.cnsrun_app_cloud_build.member
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
}

resource "google_project_iam_member" "service_github" {
  member  = google_service_account.cnsrun_app_cloud_build.member
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
}

resource "google_project_iam_member" "artifact_registry_reader" {
  member  = google_service_account.cnsrun_app_cloud_build.member
  project = var.project_id
  role    = "roles/artifactregistry.reader"
}