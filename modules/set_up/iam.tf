# Binary Authorization IAM permissions for Cloud Build service account
resource "google_project_iam_member" "cloudbuild_containeranalysis_notes_editor" {
  count   = var.create_binary_auth ? 1 : 0
  project = var.project_id
  role    = "roles/containeranalysis.notes.editor"
  member  = google_service_account.cnsrun_app_cloud_build.member
}

resource "google_project_iam_member" "cloudbuild_containeranalysis_notes_occurrences_viewer" {
  count   = var.create_binary_auth ? 1 : 0
  project = var.project_id
  role    = "roles/containeranalysis.notes.occurrences.viewer"
  member  = google_service_account.cnsrun_app_cloud_build.member
}

resource "google_project_iam_member" "cloudbuild_containeranalysis_occurrences_editor" {
  count   = var.create_binary_auth ? 1 : 0
  project = var.project_id
  role    = "roles/containeranalysis.occurrences.editor"
  member  = google_service_account.cnsrun_app_cloud_build.member
}

resource "google_project_iam_member" "cloudbuild_kms_public_key_viewer" {
  count   = var.create_binary_auth ? 1 : 0
  project = var.project_id
  role    = "roles/cloudkms.publicKeyViewer"
  member  = google_service_account.cnsrun_app_cloud_build.member
}

resource "google_project_iam_member" "cloudbuild_kms_signer" {
  count   = var.create_binary_auth ? 1 : 0
  project = var.project_id
  role    = "roles/cloudkms.signer"
  member  = google_service_account.cnsrun_app_cloud_build.member
}

resource "google_project_iam_member" "cloudbuild_binaryauthorization_attestors_viewer" {
  count   = var.create_binary_auth ? 1 : 0
  project = var.project_id
  role    = "roles/binaryauthorization.attestorsViewer"
  member  = google_service_account.cnsrun_app_cloud_build.member
}
