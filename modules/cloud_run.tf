# resource "google_cloud_run_v2_service" "cnsrun-frontend" {
#   annotations          = {}
#   client               = "gcloud"
#   client_version       = "539.0.0"
#   custom_audiences     = []
#   deletion_protection  = false
#   description          = null
#   ingress              = "INGRESS_TRAFFIC_ALL"
#   invoker_iam_disabled = false
#   labels               = {}
#   launch_stage         = "GA"
#   location             = "asia-northeast1"
#   name                 = "cnsrun-frontend"
#   project              = "cloudrun-hands-on-473403"
#   template {
#     annotations                      = {}
#     encryption_key                   = null
#     execution_environment            = null
#     gpu_zonal_redundancy_disabled    = false
#     labels                           = {}
#     max_instance_request_concurrency = 80
#     revision                         = null
#     service_account                  = "cnsrun-app-frontend"
#     session_affinity                 = false
#     timeout                          = "300s"
#     containers {
#       args           = []
#       base_image_uri = null
#       command        = []
#       depends_on     = []
#       image          = "asia-northeast1-docker.pkg.dev/cloudrun-hands-on-473403/cnsrun-app/frontend:v1"
#       name           = null
#       working_dir    = null
#       ports {
#         container_port = 8080
#         name           = "http1"
#       }
#       resources {
#         cpu_idle = true
#         limits = {
#           cpu    = "1000m"
#           memory = "512Mi"
#         }
#         startup_cpu_boost = true
#       }
#       startup_probe {
#         failure_threshold     = 1
#         initial_delay_seconds = 0
#         period_seconds        = 240
#         timeout_seconds       = 240
#         tcp_socket {
#           port = 8080
#         }
#       }
#     }
#     scaling {
#       max_instance_count = 20
#       min_instance_count = 0
#     }
#   }
#   traffic {
#     percent  = 100
#     revision = null
#     tag      = null
#     type     = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
#   }
# }
