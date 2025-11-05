resource "google_iam_workload_identity_pool" "main" {
  workload_identity_pool_id = "github"
  display_name              = "GitHub"
  disabled                  = false
  project                   = var.project_id
}

resource "google_iam_workload_identity_pool_provider" "main" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.main.workload_identity_pool_id
  workload_identity_pool_provider_id = "github"
  display_name                       = "GitHub"
  disabled                           = false
   attribute_condition = <<EOT
    attribute.repository == "yuma-pablic/cloudrun-handson-infra" || attribute.repository == "yuma-pablic/cloudrun-handson"
EOT

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
  project = var.project_id
}

resource "google_service_account_iam_member" "workload_identity_sa_iam" {
  service_account_id = google_service_account.main.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principal://iam.googleapis.com/${google_iam_workload_identity_pool.main.name}/subject/yuma-pablic/cloudrun-handson-infra"
}

resource "google_service_account" "main" {
  account_id   = "github"
  display_name = "github"
  project      = var.project_id
}
