apt-get update

apt-get install ca-certificates curl gnupg -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
apt-get install docker-compose -y
apt-get install openjdk-11-jdk -y
apt-get install maven -y

 #If the firewall is inactive, the following commands will allow OpenSSH and turn it back on: 
ufw allow OpenSSH
ufw enable

#Open Firewall
ufw allow 8080
ufw allow 22

#After this you need to login to server with command vagrant ssh slave
#create user to make connection from master via ssh-->adduser jenkins and generate password
#grant user sudo access -->sudo visudo--> add entry--> jenkins      ALL=(ALL:ALL) ALL