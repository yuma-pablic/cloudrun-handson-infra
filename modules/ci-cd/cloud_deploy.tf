resource "google_clouddeploy_target" "frontend" {
  location          = var.region
  name              = "cnsrun-frontend"
  deploy_parameters = {}
  description       = "Cloud Deploy target for cnsrun-frontend"

  execution_configs {
    usages            = ["RENDER", "DEPLOY"]
    execution_timeout = "3600s"
  }

  project          = var.project_id
  require_approval = false

  run {
    location = "projects/cloudrun-hands-on-473403/locations/asia-northeast1"
  }

  annotations = {
    "run.googleapis.com/ingress"               = "all"
    "autoscaling.knative.dev/maxScale"         = "2"
    "run.googleapis.com/execution-environment" = "gen2"
  }

  labels = {
    app = "cnsrun-frontend"
  }
}

resource "google_clouddeploy_target" "backend" {
  location          = "asia-northeast1"
  name              = "cnsrun-backend"
  deploy_parameters = {}
  description       = "Cloud Deploy target for cnsrun-backend"

  execution_configs {
    usages            = ["RENDER", "DEPLOY"]
    execution_timeout = "3600s"
  }

  project          = "cloudrun-hands-on-473403"
  require_approval = false

  run {
    location = "projects/cloudrun-hands-on-473403/locations/asia-northeast1"
  }

  annotations = {
    "run.googleapis.com/ingress"               = "all"
    "autoscaling.knative.dev/maxScale"         = "2"
    "run.googleapis.com/execution-environment" = "gen2"
  }

  labels = {
    app = "cnsrun-backend"
  }
}

