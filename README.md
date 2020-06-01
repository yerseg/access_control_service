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


