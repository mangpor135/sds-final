variable "region" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "ami" {
  type = string
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
  type    = string
}

variable "public_app_cidr" {
  default = "192.168.0.0/24"
  type    = string
}

variable "private_app_cidr" {
  default = "192.168.1.0/24"
  type    = string
}

variable "nextcloud_private_ip" {
  default = "192.168.1.101"
  type    = string
}

variable "db_private_ip" {
  default = "192.168.1.102"
  type    = string
}

variable "private_db_cidr" {
  default = "192.168.2.0/24"
  type    = string
}

variable "bucket_name" {
  type = string
}

variable "admin_user" {
  type      = string
  sensitive = true
}

variable "admin_pass" {
  type      = string
  sensitive = true
}

variable "database_name" {
  type = string
}

variable "database_user" {
  type      = string
  sensitive = true
}

variable "database_pass" {
  type      = string
  sensitive = true
}
