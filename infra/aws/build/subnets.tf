resource "aws_subnet" "nat_subnet" {
  vpc_id                  = "${aws_vpc.wordpress_vpc.id}"
  cidr_block              = "${var.nat_subnet_cidr}"
  availability_zone       = "${var.availability_zone_a}"
  map_public_ip_on_launch = "true"

  tags {
    Name        = "${var.name_prefix}-${var.environment}-nat-subnet"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "webserver_subnet" {
  vpc_id                  = "${aws_vpc.wordpress_vpc.id}"
  cidr_block              = "${var.webserver_subnet_cidr}"
  availability_zone       = "${var.availability_zone_a}"
  map_public_ip_on_launch = "true"

  tags {
    Name        = "${var.name_prefix}-${var.environment}-webserver-subnet"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "database_subnet_a" {
  vpc_id                  = "${aws_vpc.wordpress_vpc.id}"
  cidr_block              = "${var.database_subnet_cidr_a}"
  availability_zone       = "${var.availability_zone_a}"
  map_public_ip_on_launch = "false"

  tags {
    Name        = "${var.name_prefix}-${var.environment}-database-subnet-a"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "database_subnet_b" {
  vpc_id                  = "${aws_vpc.wordpress_vpc.id}"
  cidr_block              = "${var.database_subnet_cidr_b}"
  availability_zone       = "${var.availability_zone_b}"
  map_public_ip_on_launch = "false"

  tags {
    Name        = "${var.name_prefix}-${var.environment}-database-subnet-b"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}
