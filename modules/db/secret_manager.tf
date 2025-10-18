#  resource "google_secret_manager_secret" "db_password" {
#     secret_id = "cnsrun-app-db-password"
    
#     replication {
#       user_managed {
#         replicas {
#           location = "asia-northeast1"
#         }
#       }
#     }
#   }

#   # シークレットのバージョン（実際の値）を設定
#   resource "google_secret_manager_secret_version" "db_password" {
#     secret = google_secret_manager_secret.db_password.id
    
#     secret_data = var.db_password  # 変数から取得
#   }