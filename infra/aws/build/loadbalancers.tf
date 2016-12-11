resource "aws_alb" "front_loadbalancer" {
  name     = "${replace(var.name_prefix, "/[-_\\.@]/", "")}-${replace(var.environment, "/[-_\\.@]/", "")}-front-lb"
  internal = false

  security_groups = [
    "${aws_security_group.wordpress-front-loadbalancer-security-group.id}",
  ]

  subnets = [
    "${aws_subnet.webserver_subnet_a.id}",
    "${aws_subnet.webserver_subnet_b.id}",
  ]

  tags {
    Name        = "${var.name_prefix}-${var.environment}-front-loadbalancer"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
    type        = "loadbalancer"
  }
}

resource "aws_alb_target_group" "front_end" {
  name     = "${replace(var.name_prefix, "/[-_\\.@]/", "")}-${replace(var.environment, "/[-_\\.@]/", "")}-lb-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.wordpress_vpc.id}"
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = "${aws_alb.front_loadbalancer.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.front_end.arn}"
    type             = "forward"
  }
}
