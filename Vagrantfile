Vagrant.require_version ">= 1.7.0"
# Boostrap Script
#$script = <<SCRIPT
# Update & Install
#add-apt-repository ppa:vbernat/haproxy-1.5
#apt-get update
#apt-get install haproxy php5-cli
## Move SSL Certificated
#cp /vagrant/ssl/private/*.pem /etc/ssl/private/
## Configure HAPROXY
#sed -i -e 's/ENABLED=0/ENABLED=1/g' /etc/default/haproxy
#mv /etc/haproxy/haproxy.cfg{,.original}
#ln -s /vagrant/haproxy.cfg /etc/haproxy/haproxy.cfg
## Start HAPROXY
#service haproxy start
#SCRIPT

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  config.proxy.enabled = true
  HTTP_PROXY_URL = ENV['http_proxy']
  HTTPS_PROXY_URL = "#{HTTP_PROXY_URL}"

  if config.proxy.enabled === false
    puts "Proxy off!  Booting without proxy..."
  elsif Vagrant.has_plugin?("vagrant-proxyconf") && HTTPS_PROXY_URL && HTTP_PROXY_URL
    config.proxy.http     = "#{HTTP_PROXY_URL}"
    config.proxy.https    = "#{HTTPS_PROXY_URL}"
    puts "HTTP and HTTPS Proxy vars found.  Enabling proxy on VM..."
  else
    puts "Please check to make sure you have setup both your HTTP_PROXY and HTTPS_PROXY environment variables and ensure that the vagrant-proxyconf plugin is installed using the installation command: vagrant plugin install vagrant-proxyconf.\n\n"
    exit 1
  end

  config.vm.define "balancer" do |balancer|
        balancer.vm.box = "ubuntu/trusty32"
        balancer.vm.hostname = "balancer"
        balancer.vm.box_check_update = true
        balancer.vm.network "private_network", ip: "192.168.50.6"
        balancer.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "./playbook/haproxy.yml"
      end
  end

  config.vm.define "web1" do |web1|
    web1.vm.box = "centos/7"
    web1.ssh.insert_key = false
    web1.vm.network :forwarded_port, host: 3020, guest: 80
      web1.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "./playbook/Ansible_vagrant_provision.yml"
      end
  end

  config.vm.define "web2" do |web2|
    web2.vm.box = "centos/7"
    web2.ssh.insert_key = false
    web2.vm.network :forwarded_port, host: 3030, guest: 80
      web2.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "./playbook/Ansible_vagrant_provision.yml"
      end
  end
end
