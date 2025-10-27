resource "google_artifact_registry_repository" "cnsrun-app" {
  repository_id = "cnsrun-app"
  description   = "Docker repository for the-cloud-run app"
  location      = var.region
  format        = "DOCKER"
  vulnerability_scanning_config {
    enablement_config = "INHERITED"
  }
}
