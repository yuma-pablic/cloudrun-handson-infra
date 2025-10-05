resource "google_artifact_registry_repository" "cnsrun-app" {
  repository_id = "${var.environment}-cnsrun-app"
  description   = "Docker repository for the-cloud-run app"
  location      = var.region
  format        = "DOCKER"
}
