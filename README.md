# Discretionary access control service

## Description

This service monitors access rights to important system files 1 time per specified time interval (once per minute by default). If the file access rights do not match the ones specified in the service's configuration file, the service changes the access rights to the standard ones. The service configuration file `/etc/access_control.conf` contains a list of files to monitor, their access rights, owner, and owner group.

## Developers

Students of group B17-505 of NRNU MEPhI

- Georgy Bychkov ([BychkovGeorge](https://github.com/BychkovGeorge))
- Daniil Evseenkov ([VeHH-GReT-H04](https://github.com/VeHH-GReT-H04))
- Darya Ivanova ([Darya7335](https://github.com/Darya7335))
- Sergey Kazmin ([yerseg](https://github.com/yerseg))
- Anton Savchenko ([amsavchenko](https://github.com/amsavchenko))

## Manuals for demonstration

### Create a rpm package 
0. Installation of needed packages   
   `sudo yum install @development-tools rpmdev* rpm-sign`  
   `sudo yum install install policycoreutils-devel`
1. `cd ~`
2. `rpmdev-setuptree`
3. `cd ~/rpmbuild/SOURCES`
4. `mkdir access_control-1.0`
5. `cp path-to-project/src/* ./access_control-1.0`
6. `tar -cvzf access_control-1.0.tar.gz access_control-1.0`
7. `cp path-to-project/selinux/* ./`
8. `cd ../SPECS`
9. `cp path-to-project/rpm/access_control.spec ./`
10. `rpmbuild -ba access_control.spec`

### Sign the package

1. `gpg2 --gen-key`
2. `gpg2 --export -a '{name}' > ~/rpmbuild/RPM-GPG-KEY-{name}`
3. In `~/.rpmmacros` add line `%_gpg_name {name}`
4. `rpm --addsign ~/rpmbuild/RPMS/noarch/access_control-1.0-1.el7.noarch.rpm`

### Create a repository and install the package

1. `sudo yum install createrepo`
2. `sudo mkdir -p /var/www/html/mephi_project`
3. `sudo cp ~/rpmbuild/RPMS/noarch/access_control-1.0-1.el7.noarch.rpm /var/www/html/mephi_project`
4. `sudo cp ~/rpmbuild/RPM-GPG-KEY-{your-name} /var/www/html/mephi_project`
5. `sudo createrepo -v /var/www/html/mephi_project`
6. Change gpg-key name in `mephi_project.repo`
7. `sudo cp repo/mephi_project.repo /etc/yum.repos.d/`
8. `sudo yum install -y httpd` 
9. `sudo systemctl enable httpd.service`
10. `sudo systemctl start httpd.service`
11. `sudo yum update`
12. `sudo yum install access_control`

### Start a serivce and test it

1. `systemctl start access_control`
2. `systemctl status access_control`
3. `chmod +x test_access_control.sh`
4. `./test_access_control.sh`

## Service cheat-sheet

- `systemctl` - cписок запущенных юнитов
- `systemctl start access_control` - незамедлительно запустить юнит
- `systemctl stop access_control` - незамедлительно остановить юнит
- `systemctl restart access_control` - перезапустить юнит
- `systemctl status access_control` - показать статус юнита, а также запущен он или нет
- `systemctl is-enabled access_control` - проверить, включен ли юнит в автозапуск при загрузке системы
- `systemctl enable access_control` - включить юнит в автозапуск при загрузке системы
- `systemctl enable --now access_control` - включить юнит в автозапуск при загрузке системы и запустить незамедлительно
- `systemctl daemon-reload` - перезагрузить настройки systemd, чтобы он увидел новые или измененные юниты

