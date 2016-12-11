resource "aws_subnet" "nat_subnet" {
  vpc_id                  = "${aws_vpc.wordpress_vpc.id}"
  cidr_block              = "${var.nat_subnet_cidr}"
  availability_zone       = "${var.availability_zone}"
  map_public_ip_on_launch = "false"

  tags {
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "webserver_subnet" {
  vpc_id                  = "${aws_vpc.wordpress_vpc.id}"
  cidr_block              = "${var.webserver_subnet_cidr}"
  availability_zone       = "${var.availability_zone}"
  map_public_ip_on_launch = "false"

  tags {
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "database_subnet" {
  vpc_id                  = "${aws_vpc.wordpress_vpc.id}"
  cidr_block              = "${var.database_subnet_cidr}"
  availability_zone       = "${var.availability_zone}"
  map_public_ip_on_launch = "false"

  tags {
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}
