variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "service_account_id" {
  type        = string
  description = "Service Account ID"
}

variable "service_account_display_name" {
  type        = string
  description = "Service Account display name"
  default     = ""
}

variable "project_roles" {
  type        = list(string)
  description = "List of project-level IAM roles for service account"
  default     = []
}

variable "service_invoker_bindings" {
  type = list(object({
    service  = string
    location = string
  }))
  description = "List of Cloud Run services this service account can invoke"
  default     = []
}
