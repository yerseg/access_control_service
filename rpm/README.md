## RPM cheat-sheet

### Создание RPM пакета

### Создание RPM репозитория


### Установка пакета
cd ~/rpmbuild/REPO
sudo yum install -y httpd
sudo systemctl enable httpd.service
sudo systemctl start httpd.service
sudo yum install createrepo
sudo mkdir -p /var/www/html/mephi_project
sudo cp access_control-1.0-1.el7.noarch.rpm /var/www/html/mephi_project
sudo cp RPM-GPG-KEY-Evs-Pes /var/www/html/mephi_project
sudo createrepo -v /var/www/html/mephi_project
touch /etc/yum.repos.d/mephi_proj.repo
sudo yum update
sudo yum install access_control

### 
