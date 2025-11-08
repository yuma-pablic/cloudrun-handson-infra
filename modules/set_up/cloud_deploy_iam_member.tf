resource "google_project_iam_member" "log_writer" {
  member  = google_service_account.cnsrun_app_cloud_deploy.member
  project = var.project_id
  role    = "roles/logging.logWriter"
}

resource "google_project_iam_member" "cloud_deploy_job_runner" {
  member  = google_service_account.cnsrun_app_cloud_deploy.member
  project = var.project_id
  role    = "roles/clouddeploy.jobRunner"
}


resource "google_project_iam_member" "cloud_deploy_service_account" {
  member  = google_service_account.cnsrun_app_cloud_deploy.member
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
}

resource "google_project_iam_member" "run_developer" {
  member  = google_service_account.cnsrun_app_cloud_deploy.member
  project = var.project_id
  role    = "roles/run.developer"
}

resource "google_project_iam_member" "object_user" {
  member  = google_service_account.cnsrun_app_cloud_deploy.member
  project = var.project_id
  role    = "roles/storage.objectUser"
}

resource "google_project_iam_member" "cloud_deploy_artifact_registry" {
  member  = google_service_account.cnsrun_app_cloud_deploy.member
  project = var.project_id
  role    = "roles/artifactregistry.reader"
}

resource "google_project_iam_member" "cloud_deploy_run_developer" {
  member  = google_service_account.cnsrun_app_cloud_deploy.member
  project = var.project_id
  role    = "roles/run.developer"
}

resource "google_project_iam_member" "cloud_deploy_service_account_user" {
  member  = google_service_account.cnsrun_app_cloud_deploy.member
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
}