resource "google_project_service" "default" {
  disable_dependent_services = null
  disable_on_destroy         = null
  project                    = "cloudrun-hands-on-473403"
  service                    = "artifactregistry.googleapis.com"
}

