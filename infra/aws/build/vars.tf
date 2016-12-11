variable "name_prefix" {
  type        = "string"
  description = "AWS object names will have this prefix"
}

variable "region" {
  default     = "eu-west-1"
  description = "AWS region name"
}

variable "availability_zone_a" {
  default     = "eu-west-1a"
  description = "First availability zone in AWS region"
}

variable "availability_zone_b" {
  default     = "eu-west-1b"
  description = "Second availability zone in AWS region"
}

variable "environment" {
  default = "dev"
}

# networking related variables
variable "vpc_cidr" {
  default = "10.150.0.0/16"
}

variable "nat_subnet_cidr" {
  default = "10.150.0.0/24"
}

variable "webserver_subnet_cidr" {
  default = "10.150.1.0/24"
}

variable "database_subnet_cidr_a" {
  default = "10.150.2.0/24"
}

variable "database_subnet_cidr_b" {
  default = "10.150.102.0/24"
}

# database related variables
variable "wordpress_db_user" {
  default = "wordpressadmin"
}

variable "wordpress_db_password" {
  default = "wordpresspassword"
}
