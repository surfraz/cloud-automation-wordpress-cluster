resource "aws_db_subnet_group" "wordpress-rds-db-group" {
  name       = "${var.name_prefix}-${var.environment}-db-group"
  subnet_ids = ["${aws_subnet.database_subnet_a.id}", "${aws_subnet.database_subnet_b.id}"]

  tags {
    Name        = "${var.name_prefix}-${var.environment}-db-group"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_db_instance" "wordpress-rds-db" {
  availability_zone      = "${var.availability_zone_a}"
  multi_az               = false
  allocated_storage      = 10
  engine                 = "mysql"
  instance_class         = "db.t1.micro"
  name                   = "${replace(var.name_prefix, "/[-_\\.@]/", "")}${replace(var.environment, "/[-_\\.@]/", "")}wordpress"
  username               = "${var.wordpress_db_user}"
  password               = "${var.wordpress_db_password}"
  db_subnet_group_name   = "${aws_db_subnet_group.wordpress-rds-db-group.name}"
  vpc_security_group_ids = ["${aws_security_group.wordpress-rds-security-group.id}"]
  depends_on             = []
}
