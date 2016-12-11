resource "aws_db_instance" "wordpress-rds-db" {
  allocated_storage    = 10
  engine               = "mysql"
  instance_class       = "db.t1.micro"
  name                 = "${var.name_prefix}_${var.environment}_wordpress"
  username             = "${var.wordpress_db_user}"
  password             = "${var.wordpress_db_password}"
}