Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true 
  config.hostmanager.manage_host = true

  config.vm.define "nexus" do |nexus|
  config.disksize.size = '20GB'
    nexus.vm.box = "ubuntu/bionic64"
    nexus.vm.hostname = "nexus"
    nexus.vm.network "private_network", ip: "192.168.56.12"
    nexus.vm.provision "file", source: "./nexus-compose.yml", destination: "/tmp/nexus-compose.yml"
    nexus.vm.provision "shell", inline: "mv /tmp/nexus-compose.yml /opt/nexus-compose.yml"
    nexus.vm.provision "shell", path: "nexus.sh"
  nexus.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
  end
  end

  config.vm.define "sonar" do |sonar|
  config.disksize.size = '20GB'
    sonar.vm.box = "ubuntu/bionic64"
    sonar.vm.hostname = "sonar"
    sonar.vm.network "private_network", ip: "192.168.56.13"
    sonar.vm.provision "file", source: "./sonar-compose.yml", destination: "/tmp/sonar-compose.yml"
    sonar.vm.provision "shell", inline: "mv /tmp/sonar-compose.yml /opt/sonar-compose.yml"
    sonar.vm.provision "shell", path: "sonar.sh"
  sonar.vm.provider "virtualbox" do |vb|
    vb.memory = "2096"
    vb.cpus = 2
  end
  end

  config.vm.define "jenkins" do |jenkins|
    config.disksize.size = '10GB'
      jenkins.vm.box = "ubuntu/bionic64"
      jenkins.vm.hostname = "jenkins"
      jenkins.vm.network "private_network", ip: "192.168.56.14"
      jenkins.vm.provision "shell", path: "jenkins-master.sh" 
    jenkins.vm.provider "virtualbox" do |vb|
      vb.memory = "1096"
      vb.cpus = 1
    end
    end
  
    config.vm.define "slave" do |slave|
      config.disksize.size = '10GB'
        slave.vm.box = "ubuntu/bionic64"
        slave.vm.hostname = "slave"
        slave.vm.network "private_network", ip: "192.168.56.15"
        slave.vm.provider "virtualbox" do |vb|
        slave.vm.provision "shell", path: "jenkins-node.sh" 
        vb.memory = "1096"
        vb.cpus = 1
      end
      end

end  