resource "aws_vpc" "wordpress_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags {
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "wordpress_vpc_gateway" {
  vpc_id = "${aws_vpc.wordpress_vpc.id}"

  tags {
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}
