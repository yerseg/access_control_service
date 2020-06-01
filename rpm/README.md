### Создание RPM пакета

0. Установка необходимых пакетов
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
10.`rpmbuild -ba access_control.spec`
11.`cd ../RPMS/noarch/`
12.`sudo rpm -i access_control_1.0-1.el7.noarch.rpm`



