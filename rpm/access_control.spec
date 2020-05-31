Name:          access_control
Version:       1.0
Release:       1%{?dist}
Summary:       BlaBlaBla
Group:         Testing
License:       MIT
URL:           https://github.com/yerseg/access_control_service
Source0:       %{name}.tar.gz
BuildArch:     noarch

%description
A test package

%prep
%setup -q -n %{name}

%install
mkdir -p %{buildroot}/opt/access_control/
mkdir -p %{buildroot}/etc/systemd/system/
mkdir -p %{buildroot}/usr/share/man/man7/
install -m 755 access_control %{buildroot}/opt/access_control/
install -m 644 access_settings.conf %{buildroot}/opt/access_control/
install -m 644 access_control.service %{buildroot}/etc/systemd/system/
install -m 644 access_control.7.gz %{buildroot}/usr/share/man/man7/

%files
/opt/access_control/*
/etc/systemd/system/access_control.service
/usr/share/man/man7/access_control.7.gz

%changelog

