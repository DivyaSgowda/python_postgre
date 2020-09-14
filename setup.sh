#! /bin/sh


#First we retrieves information about what packages can be installed, including what updates to currently installed packages packages are available, from Internet sources
sudo yum update &&
#Use the following command to install pip for Python. We require this to install swagger-py-codegen
sudo yum install python-pip -y &&
#Now we will Swagger Py Codegen which is a Python web framework generator, which can help you generate a Python web framework automatically based on a given Swagger Specification doc.
sudo pip install swagger-py-codegen &&

#Update your package index and install Docker
sudo yum update &&
sudo yum install docker  -y  &&
#Start the Docker Service
sudo service docker start &&
#Add the ec2-user to the docker group so you can execute Docker commands without using sudo
sudo usermod -a -G docker ec2-user &&
#Make docker auto-start
sudo chkconfig docker on &&
#Get latest version of docker-compose binary from github
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose  &&
#Fix permissions
sudo chmod +x /usr/local/bin/docker-compose  &&
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
#now we are done with installation and we will write a welcome message
echo "Welcome Master we are all set to begin this journey !!!"

