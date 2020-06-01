### Создание RPM пакета
sudo yum install @development-tools rpmdev* rpm-sign
1. `cd ~`
2. `rpmdev-setuptree`
3. `cd ~/rpmbuild/SOURCES`
4. `mkdir access_control-1.0`
5. tar -cvzf access_control-1.0.tar.gz access_control-1.0/
6. rpmbuild -ba access_control.spec
7. 
8. 
9. 
set -x
make -f /usr/share/selinux/devel/Makefile access_control.pp || exit
/usr/sbin/semodule -i access_control.pp

install policycoreutils-devel
### 
