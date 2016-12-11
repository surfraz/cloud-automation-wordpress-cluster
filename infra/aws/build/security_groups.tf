resource "aws_security_group" "wordpress-rds-security-group" {
  name   = "${replace(var.name_prefix, "/[-_\\.@]/", "")}-${replace(var.environment, "/[-_\\.@]/", "")}-wordpress"
  vpc_id = "${aws_vpc.wordpress_vpc.id}"

  tags {
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${var.webserver_subnet_cidr}"]
  }
}

resource "aws_security_group" "wordpress-webserver-security-group" {
  name   = "${replace(var.name_prefix, "/[-_\\.@]/", "")}-${replace(var.environment, "/[-_\\.@]/", "")}-wordpress"
  vpc_id = "${aws_vpc.wordpress_vpc.id}"

  tags {
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
