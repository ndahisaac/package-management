Pre-requistes:
Jenkins Master is already setup and running

Steps involved:
1. Setup EC2 instance for slave
2. Create jenkins user and Install Java, Maven in Slave node
3. upload public keys from master to slave node.
4. verify ssh connection from master to slave
5. Register slave node in Jenkins master
6. Run build jobs in Jenkins slave
==============================================================================================
# Slave node configuration
#(You need to use new micro or small Ubuntu instance for this slave)
#only port 22 needs to be open

# Install Java

sudo apt-get update
sudo apt-get install default-jdk -y

#Install Maven
sudo apt-get install maven -y

#Create User as Jenkins
sudo useradd -m jenkins
sudo -u jenkins mkdir /home/jenkins/.ssh
# Master configuration 
# Add SSH Keys from Master to Slave 

# Execute the below command in Jenkins master EC2.
ssh-keygen
sudo cat ~/.ssh/id_rsa.pub
#Copy the output of the above command:

#Now Login to Slave node and execute the below command
sudo -u jenkins vi /home/jenkins/.ssh/authorized_keys

#Now go into master node
ssh jenkins@slave_node_ip

#Now copy the SSH keys into /var/lib/jenkins/.ssh by executing below command in master(make sure you exited from slave by typing exit command:
sudo cp ~/.ssh/known_hosts  /var/lib/jenkins/.ssh
# To get private key 
sudo cat ~/.ssh/id_rsa
