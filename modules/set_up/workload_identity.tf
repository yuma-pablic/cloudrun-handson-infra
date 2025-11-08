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

# ============================================
# Service Account: github-terraform
# 用途: Terraform でのインフラ管理専用
# ============================================
resource "google_service_account" "terraform" {
  account_id   = "github-terraform"
  display_name = "GitHub Actions - Terraform"
  project      = var.project_id
}

resource "google_service_account_iam_member" "terraform_workload_identity" {
  service_account_id = google_service_account.terraform.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.main.name}/attribute.repository/yuma-pablic/cloudrun-handson-infra"
}

# Terraform 実行に必要な権限
resource "google_project_iam_member" "terraform_editor" {
  project = var.project_id
  role    = "roles/editor"
  member  = google_service_account.terraform.member
}

# Terraform State 管理用（Cloud Storage アクセス）
resource "google_project_iam_member" "terraform_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = google_service_account.terraform.member
}

# ============================================
# Service Account: github-deploy
# 用途: アプリケーションのビルド・デプロイ専用
# ============================================
resource "google_service_account" "deploy" {
  account_id   = "github-deploy"
  display_name = "GitHub Actions - App Deploy"
  project      = var.project_id
}

resource "google_service_account_iam_member" "deploy_workload_identity" {
  service_account_id = google_service_account.deploy.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.main.name}/attribute.repository/yuma-pablic/cloudrun-handson"
}

# Cloud Deploy パイプライン実行権限
resource "google_project_iam_member" "deploy_clouddeploy_releaser" {
  project = var.project_id
  role    = "roles/clouddeploy.releaser"
  member  = google_service_account.deploy.member
}

# Artifact Registry への push/pull 権限
resource "google_project_iam_member" "deploy_artifactregistry_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = google_service_account.deploy.member
}

# Cloud Run への読み取り権限（デプロイ状況確認用）
resource "google_project_iam_member" "deploy_run_viewer" {
  project = var.project_id
  role    = "roles/run.viewer"
  member  = google_service_account.deploy.member
}

# Service Account として動作する権限
resource "google_project_iam_member" "deploy_service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = google_service_account.deploy.member
}

# Cloud Deploy が使用する Cloud Storage バケットへのアクセス権限
# storage.buckets.get 権限が必要なため storage.admin を付与
resource "google_project_iam_member" "deploy_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = google_service_account.deploy.member
}
