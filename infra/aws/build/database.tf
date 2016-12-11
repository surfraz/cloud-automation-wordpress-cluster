resource "aws_db_instance" "wordpress-rds-db" {
  publicly_accessible = true
  allocated_storage   = 10
  engine              = "mysql"
  instance_class      = "db.t1.micro"
  name                = "${replace(var.name_prefix, "/[-_\\.@]/", "")}${replace(var.environment, "/[-_\\.@]/", "")}wordpress"
  username            = "${var.wordpress_db_user}"
  password            = "${var.wordpress_db_password}"
}
