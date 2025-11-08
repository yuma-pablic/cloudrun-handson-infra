variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "environment" {
  type = string
}
variable "app" {
  type = string
}

variable "repository_id" {
  type = string
}

variable "service_account" {
  type = string
}

# KMS variables
variable "create_kms" {
  description = "Whether to create KMS resources"
  type        = bool
  default     = false
}

variable "keyring_name" {
  description = "The name of the KMS key ring"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "The name of the KMS crypto key"
  type        = string
  default     = ""
}

# Binary Authorization variables
variable "create_binary_auth" {
  description = "Whether to create Binary Authorization resources"
  type        = bool
  default     = false
}

variable "attestor_name" {
  description = "The name of the Binary Authorization attestor"
  type        = string
  default     = ""
}

variable "note_id" {
  description = "The ID of the Container Analysis note"
  type        = string
  default     = ""
}

variable "note_description" {
  description = "The human-readable description for the attestation note"
  type        = string
  default     = "Attestor for Cloud Run"
}

variable "app_name" {
  type = string
}