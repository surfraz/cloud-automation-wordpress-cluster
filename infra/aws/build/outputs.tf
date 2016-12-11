output "wordpress_http_lb_endpoint" {
  value = "${aws_alb.front_loadbalancer.dns_name}"
}

output "webserver_external_ips" {
  value = ["${aws_instance.webservers.*.public_ip}"]
}