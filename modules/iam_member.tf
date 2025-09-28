# resource "google_cloud_run_v2_service_iam_member" "noauth" {
#   name     = google_cloud_run_v2_service.cnsrun-app-frontend.name
#   project  = "cloudrun-hands-on-473403"
#   location = "asia-northest1"
#   role     = "roles/run.invoker"
#   member   = "allUsers"
# }
