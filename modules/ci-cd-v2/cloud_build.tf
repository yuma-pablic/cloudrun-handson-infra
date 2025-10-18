# resource "google_cloudbuild_trigger" "cnsrun_app_trigger" {
#   project            = var.project_id
#   location           = var.region
#   name               = "cnsrun-${var.app}-trigger"
#   description        = null
#   disabled           = false
#   filter             = null
#   ignored_files      = []
#   include_build_logs = null
#   included_files     = var.included_files
#   filename           = var.filename
#   service_account    = var.service_account
#   tags               = []

#   substitutions = {
#     _DEPLOY_ENV = "main"
#   }

#   approval_config {
#     approval_required = false
#   }

#   repository_event_config {
#     repository = var.repository_id
#     push {
#       branch       = "^main$"
#       invert_regex = false
#       tag          = null
#     }
#   }
# }