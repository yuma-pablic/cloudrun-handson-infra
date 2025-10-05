variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "filename" {
  type = string
}

variable "included_files" {
  type = list(string)
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