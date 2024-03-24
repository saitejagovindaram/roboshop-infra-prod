variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "prod"
}

variable "common_tags" {
  default = {
    Terraform   = "true"
    Environment = "Prod"
    Project = "roboshop"
  }
}

variable "zone_name" {
  default = "saitejag.site"
}