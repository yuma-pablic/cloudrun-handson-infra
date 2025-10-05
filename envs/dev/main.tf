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