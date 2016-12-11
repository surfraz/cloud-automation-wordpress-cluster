resource "aws_route_table" "webserver_a" {
  vpc_id = "${aws_vpc.wordpress_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.wordpress_vpc_gateway.id}"
  }

  tags {
    Name        = "${var.name_prefix}-${var.environment}-webserver_a_rt"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_route_table" "webserver_b" {
  vpc_id = "${aws_vpc.wordpress_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.wordpress_vpc_gateway.id}"
  }

  tags {
    Name        = "${var.name_prefix}-${var.environment}-webserver_b_rt"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_route_table" "database_a" {
  vpc_id = "${aws_vpc.wordpress_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.wordpress_vpc_gateway.id}"
  }

  tags {
    Name        = "${var.name_prefix}-${var.environment}-database_a_rt"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_route_table" "database_b" {
  vpc_id = "${aws_vpc.wordpress_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.wordpress_vpc_gateway.id}"
  }

  tags {
    Name        = "${var.name_prefix}-${var.environment}-database_b_rt"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "webserver_a" {
  subnet_id      = "${aws_subnet.webserver_subnet_a.id}"
  route_table_id = "${aws_route_table.webserver_a.id}"
}

resource "aws_route_table_association" "webserver_b" {
  subnet_id      = "${aws_subnet.webserver_subnet_b.id}"
  route_table_id = "${aws_route_table.webserver_b.id}"
}

resource "aws_route_table_association" "database_a" {
  subnet_id      = "${aws_subnet.database_subnet_a.id}"
  route_table_id = "${aws_route_table.database_a.id}"
}

resource "aws_route_table_association" "database_b" {
  subnet_id      = "${aws_subnet.database_subnet_b.id}"
  route_table_id = "${aws_route_table.database_b.id}"
}
