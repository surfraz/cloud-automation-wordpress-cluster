resource "aws_instance" "webserver-1" {
  ami                         = "${lookup(var.webservers_ami, var.region)}"
  instance_type               = "${var.webservers_instance_type}"
  subnet_id                   = "${aws_subnet.webserver_subnet_a.id}"
  associate_public_ip_address = true
  key_name                    = "${var.user_ssh_key_pair}"

  vpc_security_group_ids = [
    "${aws_security_group.wordpress-webserver-security-group.id}",
  ]

  private_ip = "${var.webserver_subnet_prefix_a}.11"
  user_data  = "#cloud-config\nhostname: webserver-1\nfqdn: webserver-1.${var.name_prefix}.${var.environment}"

  tags {
    Name        = "webserver-1.${var.name_prefix}.${var.environment}"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_alb_target_group_attachment" "webserver-1-lb-attachment-8080" {
  target_group_arn = "${aws_alb_target_group.front_end.arn}"
  target_id        = "${aws_instance.webserver-1.id}"
  port             = 8080
}
