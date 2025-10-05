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

resource "google_project_iam_member" "artifact_registry_reader" {
  member  = google_service_account.cnsrun_app_cloud_build.member
  project = var.project_id
  role    = "roles/artifactregistry.reader"
}

resource "google_project_iam_member" "name" {
  member  = google_service_account.cnsrun_app_frontend.member
  project = var.project_id
  role    = "roles/run.invoker"
}
