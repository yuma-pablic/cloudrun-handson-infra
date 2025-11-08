variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "app_name" {
  type        = string
  description = "Application name used for resource naming"
}

variable "backend_service_name" {
  type        = string
  description = "Backend Cloud Run service name"
}

variable "frontend_service_name" {
  type        = string
  description = "Frontend Cloud Run service name"
}

variable "location" {
  type        = string
  description = "Cloud Run service location"
  default     = "asia-northeast1"
}
