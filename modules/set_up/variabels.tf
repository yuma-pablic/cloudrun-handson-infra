variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "create_binary_auth" {
  type        = bool
  description = "Whether to create Binary Authorization IAM permissions"
  default     = false
}