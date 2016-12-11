resource "aws_instance" "webservers" {
  count                       = "${var.webservers_count}"
  ami                         = "${lookup(var.webservers_ami, var.region)}"
  instance_type               = "${var.webservers_instance_type}"
  subnet_id                   = "${aws_subnet.webserver_subnet_a.id}"
  associate_public_ip_address = true
  key_name                    = "${var.user_ssh_key_pair}"

  vpc_security_group_ids = [
    "${aws_security_group.wordpress-webserver-security-group.id}",
  ]

  private_ip = "${var.webserver_subnet_prefix_a}.${count.index + 11}"
  user_data  = "#cloud-config\nhostname: webserver-${count.index + 1}\nfqdn: webserver-${count.index + 1}.${var.name_prefix}.${var.environment}"

  tags {
    Name        = "webserver-${count.index + 1}.${var.name_prefix}.${var.environment}"
    user        = "${var.name_prefix}"
    environment = "${var.environment}"
  }
}

resource "aws_alb_target_group_attachment" "webserver-lb-attachment-8080" {
  count            = "${var.webservers_count}"
  target_group_arn = "${aws_alb_target_group.front_end.arn}"
  target_id        = "${element(aws_instance.webservers.*.id, count.index)}"
  port             = 8080
}
