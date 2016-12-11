#!/usr/bin/env bash

# exit on first failure
set -e

# use enhanced shell glob patterns
shopt -s extglob

# TODO: add description and help
# TODO: check that AWS access env variables are set
# TODO: validate inputs to script
# TODO: check that terraform and ansible are installed

if [[ $# -ne 4 ]] ; then
    echo "Usage: cloud-automation.sh <user-name> <environment> <num_instances> <aws_instance_type>"
    echo
    echo "Incorrect number of parameters given, we need 4"
    exit 1
fi

USERS_NAME="${1//+([^A-Za-z0-9])/_}" # strip characters invalid in ansible inventory
DEPLOYMENT_ENVIRONMENT="$2"
NUMBER_WEBSERVERS="$3"
SERVER_SIZE="$4"

# capture directory of script, in case we are run from elsewhere
pushd "`dirname ${0}`" > /dev/null
SCRIPTPATH="`pwd`"

pushd . > /dev/null
cd "${SCRIPTPATH}/infra/aws/build/"

# run terraform to build infrastructure
terraform apply \
    -var "name_prefix=${USERS_NAME}" \
    -var "environment=${DEPLOYMENT_ENVIRONMENT}" \
    -var "webservers_count=${NUMBER_WEBSERVERS}" \
    -var "webservers_instance_type=${SERVER_SIZE}"

# capture output from terraform for use in ansible
WORDPRESS_DB_HOST="`terraform output wordpress_db_host`"
WORDPRESS_DB_USERNAME="`terraform output wordpress_db_username`"
WORDPRESS_DB_PASSWORD="`terraform output wordpress_db_password`"
WORDPRESS_LB_ENDPOINT="`terraform output wordpress_http_lb_endpoint`"

# switch to location of ansible playbooks
cd "${SCRIPTPATH}/infra/aws/deploy/"

# run ansible to provision webservers
ansible-playbook playbooks/bootstrap_webservers.yml \
    -e "user_name=${USERS_NAME}" \
    -e "user_environment=${DEPLOYMENT_ENVIRONMENT}" \
    -e "wordpress_db_host=${WORDPRESS_DB_HOST}" \
    -e "wordpress_db_user=${WORDPRESS_DB_USERNAME}" \
    -e "wordpress_db_password=${WORDPRESS_DB_PASSWORD}"

# show user the URL to visit
echo
echo "Wordpress URL: http://${WORDPRESS_LB_ENDPOINT}"