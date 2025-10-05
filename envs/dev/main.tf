module "enable_apis" {
  source     = "../../modules/enabled_api"
  project_id = local.project_id
}

module "set_up" {
  source      = "../../modules/set_up"
  project_id  = local.project_id
  region      = local.region
  environment = local.environment
}

module "register" {
  source      = "../../modules/register"
  environment = local.environment
  region      = local.region
}
module "ci_cd_frontend" {
  source          = "../../modules/ci-cd-v2"
  project_id      = local.project_id
  region          = local.region
  environment     = local.environment
  app             = "frontend"
  filename        = "../../../../yuma-pablic/cloudrun-handson/app/frontend/cloudbuild_push.yaml"
  included_files  = ["../../../../yuma-pablic/cloudrun-handson/app/frontend/cloudbuild_push.yaml"]
  repository_id   = module.set_up.repository_id
  service_account = module.set_up.cloud_build_service_account
}

module "ci_cd_backend" {
  source          = "../../modules/ci-cd-v2"
  project_id      = local.project_id
  region          = local.region
  environment     = local.environment
  app             = "backend"
  filename        = "../../../../yuma-pablic/cloudrun-handson/app/backend/cloudbuild_push.yaml"
  included_files  = ["../../../../yuma-pablic/cloudrun-handson/app/backend/cloudbuild_push.yaml"]
  repository_id   = module.set_up.repository_id
  service_account = module.set_up.cloud_build_service_account
}