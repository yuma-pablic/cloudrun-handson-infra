variable "vpc_self_link" {
  description = "The self link of the VPC network"
  type        = string
}

variable "private_vpc_connection_network" {
  description = "The network of the VPC peering connection"
  type        = string
}

variable "app_name" {
  type = string
}
