variable "name_prefix" {
  type = "string"
  description = "AWS object names will have this prefix"
}

variable "region" {
  default = "eu-west-1"
  description = "AWS region name"
}

variable "environment" {
  default = "dev"
}

# database related variables
variable "wordpress_db_user" {
  default = "wordpressadmin"
}

variable "wordpress_db_password" {
  default = "wordpresspassword"
}