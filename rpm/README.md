### Создание RPM пакета
1. `sudo yum install @development-tools rpmdev* rpm-sign` 
2. `cd ~`
3. `rpmdev-setuptree`
4. `cd ~/rpmbuild/SOURCES`
5. `mkdir access_control-1.0` #NAME = access_control
6. `cd access_control-1.0`
7. `cp service/access_control ./`
8. `cd ../`
9. `tar -cvzf access_control-1.0.tar.gz access_control-1.0`
10. `cd ../SPECS`
11. `rpmbuild -ba access_control.spec`
### 
