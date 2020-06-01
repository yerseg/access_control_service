### Создание RPM пакета

0. `sudo yum install @development-tools rpmdev* rpm-sign`
1. `cd ~`
2. `rpmdev-setuptree`
3. `cd ~/rpmbuild/SOURCES`
4. `mkdir access_control-1.0`
5. `tar -cvzf access_control-1.0.tar.gz access_control-1.0`
6. `cd ../SPECS`
7. `rpmbuild -ba access_control.spec`
 
For SELinux
- `set -x`
- `make -f /usr/share/selinux/devel/Makefile access_control.pp`
- `/usr/sbin/semodule -i access_control.pp`

- `#$ yum install install policycoreutils-devel`

