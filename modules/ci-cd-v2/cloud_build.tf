resource "google_cloudbuild_trigger" "cnsrun_app_trigger" {
  project  = var.project_id
  location = var.region
  name     = "cnsrun-${var.app}-trigger"

  repository_event_config {
    repository = var.repository_id
    push {
      branch = "^main$"
    }
  }

  filename = var.filename

  included_files = var.included_files

  substitutions = {
    _DEPLOY_ENV = "main"
  }

  service_account = var.service_account
}