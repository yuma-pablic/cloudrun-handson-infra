resource "google_service_account" "cnsrun-app-frontend" {
  account_id   = "cnsrun-app-frontend"
  display_name = "cnsrun-app-frontend"
}

resource "google_service_account" "cnsrun-cloudbuild" {
  account_id   = "cnsrun-cloudbuild"
  display_name = "Service Account for Cloud Build in cnsrun"
}

resource "google_project_iam_member" "cloud_build" {
  member  = google_service_account.cnsrun-cloudbuild.member
  project = "cloudrun-hands-on-473403"
  role    = "roles/cloudbuild.builds.builder"
}

resource "google_project_iam_member" "cloud_logging" {
  member  = google_service_account.cnsrun-cloudbuild.member
  project = "cloudrun-hands-on-473403"
  role    = "roles/logging.logWriter"
}

resource "google_project_iam_member" "cloud_deploy" {
  member  = google_service_account.cnsrun-cloudbuild.member
  project = "cloudrun-hands-on-473403"
  role    = "roles/clouddeploy.releaser"
}

resource "google_project_iam_member" "service_account" {
  member  = google_service_account.cnsrun-cloudbuild.member
  project = "cloudrun-hands-on-473403"
  role    = "roles/iam.serviceAccountUser"
}

resource "google_project_iam_member" "service_github" {
  member  = google_service_account.cnsrun-cloudbuild.member
  project = "cloudrun-hands-on-473403"
  role    = "roles/secretmanager.secretAccessor"
}

resource "google_service_account" "cnsrun-clouddeploy" {
  account_id   = "cnsrun-clouddeploy"
  display_name = "Service Account for Cloud Deploy in cnsrun"
}

resource "google_project_iam_member" "log_writer" {
  member  = google_service_account.cnsrun-clouddeploy.member
  project = "cloudrun-hands-on-473403"
  role    = "roles/logging.logWriter"
}

resource "google_project_iam_member" "cloud_deploy_job_runner" {
  member  = google_service_account.cnsrun-clouddeploy.member
  project = "cloudrun-hands-on-473403"
  role    = "roles/clouddeploy.jobRunner"
}


resource "google_project_iam_member" "cloud_deploy_service_account" {
  member  = google_service_account.cnsrun-clouddeploy.member
  project = "cloudrun-hands-on-473403"
  role    = "roles/iam.serviceAccountUser"
}

resource "google_project_iam_member" "run_developer" {
  member  = google_service_account.cnsrun-clouddeploy.member
  project = "cloudrun-hands-on-473403"
  role    = "roles/run.developer"
}

resource "google_project_iam_member" "object_user" {
  member  = google_service_account.cnsrun-clouddeploy.member
  project = "cloudrun-hands-on-473403"
  role    = "roles/storage.objectUser"
}






