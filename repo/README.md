### Создание RPM репозитория

1. `sudo yum install -y httpd` 
2. `sudo systemctl enable httpd.service`
3. `sudo systemctl start httpd.service`
4. `sudo yum install createrepo`
5. `cd ~/rpmbuild/REPO`
6. `sudo mkdir -p /var/www/html/mephi_project`
7. `sudo cp *.rpm /var/www/html/mephi_project`
8. `sudo cp RPM-GPG-KEY-Evs-Pes /var/www/html/mephi_project`
9. `sudo createrepo -v /var/www/html/mephi_project`
10. `sudo yum update`

