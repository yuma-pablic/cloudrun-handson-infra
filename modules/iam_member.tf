# resource "google_cloud_run_service_iam_member" "editor" {
#   location = "asia-northeast1"
#   member   = "allUsers"
#   project  = "cloudrun-hands-on-473403"
#   role     = "roles/run.invoker"
#   service  = "v1/projects/cloudrun-hands-on-473403/locations/asia-northeast1/services/cnsrun-frontend"
# }

