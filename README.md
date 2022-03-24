# Terraform Installation


How to Install Terraform on Ubuntu/Debian using APT

Add the Hashicorp signing key in Ubuntu/Debian

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -


Add the Hashicorp official apt reposity

sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

Install the latest version of terraform on ubuntu/terraform

sudo apt install terraform


To check current and all versions of terraform

apt policy terraform

select the specific terraform version and install it

sudo apt install terraform=0.14.0
