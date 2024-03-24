variable "module_src" {
  type = string
  default = "git::https://github.com/saitejagovindaram/terraform-aws_vpc.git"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
  type = string
}

variable "project_name" {
  default = "roboshop"
  type = string
}

variable "environment" {
  default = "prod"
  type = string
}

variable "public_subnet_cidrs" {
  default = ["10.10.1.0/24", "10.10.2.0/24"]
  type = list(string)
}

variable "private_subnet_cidrs" {
  default = ["10.10.11.0/24", "10.10.22.0/24"]
  type = list(string)
}

variable "database_subnet_cidrs" {
  default = ["10.10.111.0/24", "10.10.222.0/24"]
  type = list(string)
}

variable "isPeeringRequired" {
  default = true
}

variable "common_tags" {
  default = {
    Terraform = true
    Project = "roboshop"
    Environment = "Prod"
  }
  type = map
}