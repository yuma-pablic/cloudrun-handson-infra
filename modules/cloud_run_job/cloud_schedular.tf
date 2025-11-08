# resource "google_cloud_scheduler_job" "cnsrun_batch_job_scheduler" {
#   name             = "cnsrun-batch-job-scheduler"
#   description      = "Run the batch job every minute"
#   schedule         = "* * * * *"
#   time_zone        = "Asia/Tokyo"
#   region           = "asia-northeast1"
#   attempt_deadline = "300s"
#
#   http_target {
#     http_method = "POST"
#     uri         = "https://asia-northeast1-run.googleapis.com/apis/run.googleapis.com/v1/namespaces/${var.project_id}/jobs/cnsrun-batch:run"
#
#     oauth_token {
#       service_account_email = google_service_account.cnsrun_app_batch.email
#     }
#   }
# }
