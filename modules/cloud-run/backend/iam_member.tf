resource "google_project_iam_member" "artifact_registry_reader" {
  member  = google_service_account.backend.member
  project = var.project_id
  role    = "roles/artifactregistry.reader"
}

resource "google_project_iam_member" "db_password" {
  member  = google_service_account.backend.member
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
}

resource "google_project_iam_member" "db" {
  member  = google_service_account.backend.member
  project = var.project_id
  role    = "roles/cloudsql.client"
}
