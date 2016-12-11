resource "aws_route_table" "nat" {
  vpc_id = "${aws_vpc.wordpress_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.wordpress_vpc_gateway.id}"
  }

  tags {
    Name        = "${var.name_prefix}-${var.environment}-nat-gateway"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "nat" {
  subnet_id      = "${aws_subnet.webserver_subnet_a.id}"
  route_table_id = "${aws_route_table.nat.id}"
}
