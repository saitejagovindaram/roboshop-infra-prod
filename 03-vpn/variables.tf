variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "prod"
}

variable "common_tags" {
  default = {
    Terraform   = "true"
    Environment = "prod"
    Project = "roboshop"
  }
}