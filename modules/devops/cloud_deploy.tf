resource "google_clouddeploy_target" "app" {
  location          = var.region
  name              = "cnsrun-${var.app}"
  deploy_parameters = {}
  description       = "Cloud Deploy target for cnsrun-${var.app}"

  execution_configs {
    usages            = ["RENDER", "DEPLOY"]
    execution_timeout = "3600s"
  }

  project          = var.project_id
  require_approval = false

  run {
    location = "projects/${var.project_id}/locations/${var.region}"
  }

  annotations = {
    "run.googleapis.com/ingress"               = "all"
    "autoscaling.knative.dev/maxScale"         = "2"
    "run.googleapis.com/execution-environment" = "gen2"
  }

  labels = {
    app = "cnsrun-${var.app}"
  }
}