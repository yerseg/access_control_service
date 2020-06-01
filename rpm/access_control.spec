%define relabel_files() \
restorecon -R -v /usr/bin; \
restorecon -R -v /usr/lib/systemd/system; \

%define selinux_policyver 3.13.1-266

Name:          access_control
Version:       1.0
Release:       1%{?dist}
Summary:       BlaBlaBla
Group:         Testing
License:       MIT
URL:           https://github.com/yerseg/access_control_service
Source0:       %{name}-%{version}.tar.gz
Source1:        %{name}.if
Source2:        %{name}.te
Source3:        %{name}.fc
Requires:      /bin/bash, /bin/rm, /bin/mkdir, /bin/cp, policycoreutils, policycoreutils-devel, libselinux-utils
Requires(post): selinux-policy-base >= %{selinux_policyver}, policycoreutils, policycoreutils-devel, /usr/sbin/semodule
Requires(postun): policycoreutils, policycoreutils-devel, /usr/sbin/semodule
BuildArch:     noarch

%description
A test package

%prep
%setup -q
mkdir selinux
cp -p %{SOURCE1} %{SOURCE2} %{SOURCE3} selinux/

%build

cd selinux/
make -f /usr/share/selinux/devel/Makefile %{name}.pp
cd ..

%install

cd selinux/
install -d %{buildroot}%{_datadir}/selinux/
install -p -m 644 %{name}.pp %{buildroot}%{_datadir}/selinux/%{name}.pp
cd ..

mkdir -p %{buildroot}/opt/access_control/
mkdir -p %{buildroot}/etc/systemd/system/
mkdir -p %{buildroot}%{_mandir}/man7/

install -m 755 access_control %{buildroot}/opt/access_control/
install -m 644 access_settings.conf %{buildroot}/opt/access_control/
install -m 644 access_control.service %{buildroot}/etc/systemd/system/
install -m 644 access_control.7.gz %{buildroot}%{_mandir}/man7/

%post
%{_sbindir}/semodule -i %{name}.pp 
if %{_sbindir}/selinuxenabled ; then
    %{_sbindir}/load_policy
    %relabel_files
fi;
exit 0

%postun
if [ $1 -eq 0 ]; then
    %{_sbindir}/semodule -n -r %{name}
    if %{_sbindir}/selinuxenabled ; then
       %{_sbindir}/load_policy
       %relabel_files
    fi;
fi;
exit 0

%files
/opt/access_control/*
/etc/systemd/system/access_control.service
%{_mandir}/man7/access_control.7.gz
%attr(0600,root,root) %{_datadir}/selinux/%{name}.pp

%changelog
* Sat May 20 2020 access-control-service
- Added access-control-service
