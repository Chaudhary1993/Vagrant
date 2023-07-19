#install java 11 
apt-get update
apt-get install openjdk-11-jdk -y

#link the repository of Debian packages to the sources.list of the server
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
apt-get update


#install Jenkins
apt-get install jenkins -y 

#Start Jenkins in background
nohup systemctl start jenkins.service &

#Wait for activation of jenkins service
while true; do
    if [ $(systemctl is-active jenkins) == "active" ]; then
        break
    fi

    sleep 1
done

#Enable Jenkins Service
systemctl enable jenkins.service 

#install firewall{ufw}if not available 
apt install ufw -y

#If the firewall is inactive, the following commands will allow OpenSSH and turn it back on: 
ufw allow OpenSSH
ufw enable

#Open Firewall
ufw allow 8080