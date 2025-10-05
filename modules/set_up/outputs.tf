output "repository_id" {
  value = google_cloudbuildv2_repository.cnsrun_app_repo.id
}

output "cloud_build_service_account" {
  value = google_service_account.cnsrun_app_cloud_build.id
}