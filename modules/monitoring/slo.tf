resource "google_monitoring_service" "cnsrun_frontend" {
  service_id   = local.service_id
  display_name = "CNSRUN Frontend"

  basic_service {
    service_type = "CLOUD_RUN"
    service_labels = {
      service_name = local.service_id
      location     = var.region
    }
  }
}
# SLO with availability-based SLI
resource "google_monitoring_slo" "cloudrun_availability_slo" {
  project      = var.project_id
  service      = google_monitoring_service.cnsrun_frontend.service_id
  slo_id       = local.slo_id
  display_name = "Terraform Test SLO with request based SLI (good total ratio)"

  goal                = 0.99
  calendar_period     = "DAY"
  rolling_period_days = null

  basic_sli {
    availability {
      enabled = true
    }
  }
}
