resource "google_project_service" "default" {
  for_each = toset([
    "artifactregistry.googleapis.com",
    "run.googleapis.com",
    "cloudbuild.googleapis.com",
    "container.googleapis.com",
    "secretmanager.googleapis.com",
    "cloudscheduler.googleapis.com",
    "clouddeploy.googleapis.com",
    "servicenetworking.googleapis.com",
    "sqladmin.googleapis.com"
  ])

  disable_dependent_services = null
  disable_on_destroy         = false
  project                    = "cloudrun-hands-on-473403"
  service                    = each.value
}

