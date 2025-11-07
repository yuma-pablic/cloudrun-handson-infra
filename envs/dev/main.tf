module "enable_apis" {
  source     = "../../modules/enabled_api"
  project_id = local.project_id
}

module "set_up" {
  source             = "../../modules/set_up"
  project_id         = local.project_id
  region             = local.region
  environment        = local.environment
  create_binary_auth = true
}

module "register" {
  source      = "../../modules/register"
  environment = local.environment
  region      = local.region
}

module "ci_cd_frontend" {
  source          = "../../modules/devops"
  project_id      = local.project_id
  region          = local.region
  environment     = local.environment
  app             = "frontend"
  filename        = "../../../../yuma-pablic/cloudrun-handson/app/frontend/cloudbuild_push.yaml"
  included_files  = ["../../../../yuma-pablic/cloudrun-handson/app/frontend/**"]
  repository_id   = "projects/cloudrun-hands-on-473403/locations/asia-northeast1/connections/dev-cloudrun-handson-infra/repositories/dev-cnsrun-app"
  service_account = "projects/cloudrun-hands-on-473403/serviceAccounts/cnsrun-cloudbuild@cloudrun-hands-on-473403.iam.gserviceaccount.com"

  # KMS configuration
  create_kms   = true
  keyring_name = "cnsrun-keyring"
  key_name     = "cnsrun-attestor-key"

  # Binary Authorization configuration
  create_binary_auth = true
  attestor_name      = "cnsrun-attestor"
  note_id            = "cnsrun-attestor-note"
  note_description   = "Attestor for Cloud Run"
}

module "ci_cd_backend" {
  source          = "../../modules/devops"
  project_id      = local.project_id
  region          = local.region
  environment     = local.environment
  app             = "backend"
  filename        = "../../../../yuma-pablic/cloudrun-handson/app/backend/cloudbuild_push.yaml"
  included_files  = ["../../../../yuma-pablic/cloudrun-handson/app/backend/cloudbuild_push.yaml"]
  repository_id   = module.set_up.repository_id
  service_account = module.set_up.cloud_build_service_account
}
#
# ╭──────────────────────────────────────────────────────────╮
# │ You need to comment this out once to create the resource.│
# ╰──────────────────────────────────────────────────────────╯

module "network" {
  source     = "../../modules/network"
  project_id = local.project_id
  region     = local.region
}

module "db" {
  source                         = "../../modules/db"
  vpc_self_link                  = module.network.vpc_self_link
  private_vpc_connection_network = module.network.private_vpc_connection_network
}
#
module "load_balancer" {
  source = "../../modules/load_balancer"
}

module "monitoring" {
  source       = "../../modules/monitoring"
  project_id   = local.project_id
  service_name = "cnsrun-frontend"
  region       = local.region
}

module "worked_ientity" {
  source     = "../../modules/worked_identity"
  project_id = local.project_id
}
