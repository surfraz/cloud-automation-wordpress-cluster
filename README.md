# Wordpress environment cloud automation

A provisioning tool for creating a loadbalanced and dockerized wordpress cluster in AWS

## Requirements

* Terraform
* Ansible 2
* AWS Environment variables for terraform and ansible to access the AWS API

## Usage
```cloud-automation.sh <user-name> <environment> <num_instances> <aws_instance_type>```

Where:-
 - user-name = your name, e.g. surfraz.ahmed
 - environment = something to identified the created AWS resources, e.g. staging
 - num_instances = the number of loadbalanced webserver instances to create
 - aws_instance_type = size of the aws webserver instances, e.g. t1.micro
 

# TODO/Bugs:-
 - I need more time to debug the wordpress to RDS db connectivity
 - Better output and validation in the cloud-automation.sh script
 - Use terraform modules for DB and Webserver instances
 - Write an infrastructure test suite

# License
GNU GPL v2 or higher