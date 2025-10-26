# resource "google_project_iam_member" "cnsrun_app_db_password" {
#   member  = google_service_account.app.member
#   project = var.project_id
#   role    = "roles/secretmanager.secretAccessor"
# }
#
# resource "google_project_iam_member" "cnsrun_app_db" {
#   member  = google_service_account.app.member
#   project = var.project_id
#   role    = "roles/cloudsql.client"
# }

