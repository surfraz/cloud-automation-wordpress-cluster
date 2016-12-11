output "wordpress_http_lb_endpoint" {
  value = "${aws_alb.front_loadbalancer.dns_name}"
}

output "webserver_external_ips" {
  value = ["${aws_instance.webservers.*.public_ip}"]
}

output "wordpress_db_host" {
  value = "${aws_db_instance.wordpress-rds-db.endpoint}"
}

output "wordpress_db_username" {
  value = "${aws_db_instance.wordpress-rds-db.username}"
}

output "wordpress_db_password" {
  value = "${aws_db_instance.wordpress-rds-db.password}"
}
