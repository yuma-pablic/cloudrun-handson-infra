locals {
  backend_service_name = "${var.app_name}-backend-services"
  neg_name             = "${var.app_name}-app-neg-asia-northeast1"
  frontend_service     = "${var.app_name}-frontend"
  certificate_prefix   = "${var.app_name}-certificate"
  https_proxy_name     = "${var.app_name}-https-proxies"
  ssl_policy_name      = "${var.app_name}-ssl-policy"
  ip_name              = "${var.app_name}-ip"
  forwarding_rule_name = "${var.app_name}-lb"
  url_map_name         = "${var.app_name}-urlmaps"
}
