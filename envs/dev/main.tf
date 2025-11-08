module "enable_apis" {
  source     = "../../modules/enabled_api"
  project_id = local.project_id
}

module "set_up" {
  source      = "../../modules/set_up"
  project_id  = local.project_id
  region      = local.region
  environment = local.environment
  app_name    = local.app_name
}

# module "devops_frontend" {
#   source          = "../../modules/devops"
#   project_id      = local.project_id
#   region          = local.region
#   environment     = local.environment
#   app             = "frontend"
#   app_name        = local.app_name
#   service_account = "projects/cloudrun-hands-on-473403/serviceAccounts/${local.app_name}-cloudbuild@cloudrun-hands-on-473403.iam.gserviceaccount.com"

#   # KMS configuration
#   create_kms   = true
#   keyring_name = "${local.app_name}-keyring"
#   key_name     = "${local.app_name}-attestor-key"

#   # Binary Authorization configuration
#   create_binary_auth = true
#   attestor_name      = "${local.app_name}-attestor"
#   note_id            = "${local.app_name}-attestor-note"
#   note_description   = "Attestor for Cloud Run"
# }

# module "devops_backend" {
#   source          = "../../modules/devops"
#   project_id      = local.project_id
#   region          = local.region
#   environment     = local.environment
#   app             = "backend"
#   app_name        = local.app_name
#   service_account = module.set_up.cloud_build_service_account
# }
#

module "network" {
  source     = "../../modules/network"
  project_id = local.project_id
  region     = local.region
  app_name   = local.app_name
}

module "db" {
  source                         = "../../modules/db"
  vpc_self_link                  = module.network.vpc_self_link
  private_vpc_connection_network = module.network.private_vpc_connection_network
  app_name                       = local.app_name
}

# ╭──────────────────────────────────────────────────────────╮
# │ You need to comment this out once to create the resource.│
# ╰──────────────────────────────────────────────────────────╯

# module "load_balancer" {
#   source   = "../../modules/load_balancer"
#   app_name = local.app_name
# }

# module "monitoring" {
#   source       = "../../modules/monitoring"
#   project_id   = local.project_id
#   service_name = "${local.app_name}-frontend"
#   region       = local.region
#   app_name     = local.app_name
# }
