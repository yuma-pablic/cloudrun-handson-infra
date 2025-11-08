# Cloud Runサービスへのアクセスをロードバランサーに許可
resource "google_cloud_run_service_iam_member" "frontend_lb_invoker" {
  service  = local.frontend_service
  location = "asia-northeast1"
  role     = "roles/run.invoker"
  member   = "allUsers" # Load Balancer経由のアクセスにはallUsersが必要
}
