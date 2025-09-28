#!/bin/bash
set -e

rm -rf ~/rpmbuild
rpmdev-setuptree

readonly SOURCE=src
readonly TARGET=~/rpmbuild/BUILD

# Spec File
cp $SOURCE/RPMS/siakhooi-fileutils.spec ~/rpmbuild/SPECS

# Binary File
mkdir -p $TARGET/usr/bin
find $SOURCE/bin -type f -exec cp -vr {} "$TARGET/usr/bin" \;
chmod 755 $TARGET/usr/bin/*

# License
cp -vf ./LICENSE "$TARGET/"

# build rpm file
rpmlint ~/rpmbuild/SPECS/siakhooi-fileutils.spec
rpmbuild -bb -vv ~/rpmbuild/SPECS/siakhooi-fileutils.spec
cp -vf ~/rpmbuild/RPMS/noarch/siakhooi-fileutils-*.rpm .

# query
tree ~/rpmbuild/
rpm -ql ~/rpmbuild/RPMS/noarch/siakhooi-fileutils-*.rpm

rpm_file=$(basename "$(ls ./siakhooi-fileutils-*.rpm)")

sha256sum "$rpm_file" >"$rpm_file.sha256sum"
sha512sum "$rpm_file" >"$rpm_file.sha512sum"
