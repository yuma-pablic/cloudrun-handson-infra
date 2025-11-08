locals {
  vpc_name        = "${var.app_name}-app"
  subnet_name     = "${var.app_name}-cloudrun-hands-on-473403"
  waf_policy_name = "${var.app_name}-waf-policy"
  db_private_ip   = "cnsrn-${var.app_name}-private-ip-address"
}
