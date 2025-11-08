resource "google_clouddeploy_target" "app" {
  location          = var.region
  name              = local.pipeline_name
  deploy_parameters = {}
  description       = "Cloud Deploy target for ${local.pipeline_name}"

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
    app = local.pipeline_name
  }
}