Name:           siakhooi-fileutils
Version:        0.1.0
Release:        1%{?dist}
Summary:        common file utils

License:        MIT
URL:            https://github.com/siakhooi/bash-fileutils
Source0:        https://github.com/siakhooi/%{name}/archive/refs/tags/${version}.tar.gz
BuildArch:      noarch

Requires:       bash, coreutils

%description
common file utils

%install
%{__mkdir}   -v -p %{buildroot}%{_bindir}
%{__mkdir}   -v -p %{buildroot}/usr/share/licenses/siakhooi-fileutils
%{__install} -v -m 0755 %{_topdir}/BUILD/usr/bin/* %{buildroot}%{_bindir}
%{__install} -v -m 644  %{_topdir}/BUILD/LICENSE                 %{buildroot}/usr/share/licenses/siakhooi-fileutils

%files
%license LICENSE
%{_bindir}/nested-files-list

%changelog
* Sun Sep 28 2025 Siak Hooi <siakhooi@gmail.com> - 0.1.0
- initial version
