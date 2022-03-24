# Terraform Installation



Step1- Register HashiCorp GPG keys$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
$ sudo apt install curl

Step2- Add HashiCorp package repository
After adding the gpg key successfully. You need to add the HashiCorp repository to download and install terraform packages using apt.

$ sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

Step3- Update "Ubuntu" packages list
$ sudo apt update

Step4- Install Terraform on Ubuntu

$ sudo apt install terraform

# Check version of Terraform 
$ terraform -v
![image](https://user-images.githubusercontent.com/97225776/159884288-5ad060e8-02b8-469e-a126-146732111939.png)
