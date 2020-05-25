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


