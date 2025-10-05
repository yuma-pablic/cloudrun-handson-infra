resource "google_cloudbuild_trigger" "cnsrun_frontend_trigger" {
  project  = var.project_id
  location = var.region
  name     = "cnsrun-frontend-trigger"

  repository_event_config {
    repository = google_cloudbuildv2_repository.cnsrun_app_repo.id
    push {
      branch = "^main$"
    }
  }

  filename = "../../cloudrun-handson/app/frontend/cloudbuild_push.yaml"
  # file_name = "../../cloudrun-handson/app/frontend/cloudbuild_push.yaml"

  included_files = ["../../cloudrun-handson/app/frontend/**"]
  # included_files = ["../../cloudrun-handson/app/frontend/**"]

  substitutions = {
    _DEPLOY_ENV = "main"
  }

  service_account = "projects/cloudrun-hands-on-473403/serviceAccounts/cnsrun-cloudbuild@cloudrun-hands-on-473403.iam.gserviceaccount.com"
}


resource "google_cloudbuild_trigger" "cnsrun_frontend_trigger" {
  project  = "cloudrun-hands-on-473403"
  location = "asia-northeast1"
  name     = "cnsrun-frontend-triggerer"

  repository_event_config {
    repository = google_cloudbuildv2_repository.cnsrun_app_repo.id
    push {
      branch = "^main$"
    }
  }

  filename = "../../cloudrun-handson/app/backend/cloudbuild_push.yaml"

  included_files = ["../../cloudrun-handson/app/backend/**"]

  substitutions = {
    _DEPLOY_ENV = "main"
  }

  service_account = "projects/cloudrun-hands-on-473403/serviceAccounts/cnsrun-cloudbuild@cloudrun-hands-on-473403.iam.gserviceaccount.com"

}

