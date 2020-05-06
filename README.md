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
