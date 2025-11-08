# Project-level IAM permissions
resource "google_project_iam_member" "project_roles" {
  for_each = toset(var.project_roles)
  member   = google_service_account.this.member
  project  = var.project_id
  role     = each.value
}

# Cloud Run service invoker permissions
resource "google_cloud_run_service_iam_member" "service_invoker" {
  for_each = { for idx, binding in var.service_invoker_bindings : idx => binding }
  service  = each.value.service
  location = each.value.location
  role     = "roles/run.invoker"
  member   = google_service_account.this.member
}
