data "google_secret_manager_secret" "sample-secret" {
  secret_id = "github"
}

data "google_secret_manager_secret_version" "sample-version" {
  project = "cloudrun-hands-on-473403"
  secret  = data.google_secret_manager_secret.sample-secret.id
  version = "latest"
}

resource "google_secret_manager_secret_iam_member" "policy" {
  project   = data.google_secret_manager_secret.sample-secret.project
  secret_id = data.google_secret_manager_secret.sample-secret.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = google_service_account.cnsrun-cloudbuild.member
}

# Grant access to the Cloud Build default service account as well
resource "google_secret_manager_secret_iam_member" "cloudbuild_default" {
  project   = data.google_secret_manager_secret.sample-secret.project
  secret_id = data.google_secret_manager_secret.sample-secret.secret_id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:service-412410043737@gcp-sa-cloudbuild.iam.gserviceaccount.com"
}

resource "google_cloudbuildv2_connection" "my_connection" {
  project  = "cloudrun-hands-on-473403"
  location = "asia-northeast1"
  name     = "cloudrun-handson-infra"

  github_config {
    app_installation_id = "87705649"
    authorizer_credential {
      oauth_token_secret_version = data.google_secret_manager_secret_version.sample-version.id
    }
  }
  depends_on = [
    google_secret_manager_secret_iam_member.policy,
    google_secret_manager_secret_iam_member.cloudbuild_default
  ]
}

resource "google_cloudbuildv2_repository" "cnsrun_app_repo" {
  project           = "cloudrun-hands-on-473403"
  location          = "asia-northeast1"
  name              = "cnsrun-app"
  parent_connection = google_cloudbuildv2_connection.my_connection.id
  remote_uri        = "https://github.com/yuma-pablic/cloudrun-handson.git"
}

resource "google_cloudbuild_trigger" "cnsrun_frontend_trigger" {
  project  = "cloudrun-hands-on-473403"
  location = "asia-northeast1"
  name     = "cnsrun-frontend-trigger"

  repository_event_config {
    repository = google_cloudbuildv2_repository.cnsrun_app_repo.id
    push {
      branch = "^main$"
    }
  }

  filename = "../../cloudrun-handson/app/frontend/cloudbuild_push.yaml"

  included_files = ["../../cloudrun-handson/app/frontend/**"]

  substitutions = {
    _DEPLOY_ENV = "main"
  }

  service_account = "projects/cloudrun-hands-on-473403/serviceAccounts/cnsrun-cloudbuild@cloudrun-hands-on-473403.iam.gserviceaccount.com"

  depends_on = [
    google_cloudbuildv2_connection.my_connection,
    google_cloudbuildv2_repository.cnsrun_app_repo
  ]
}
