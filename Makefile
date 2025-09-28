set-version:
	scripts/set-version.sh
clean:
	scripts/clean.sh
build-deb: clean
	./scripts/shellcheck.sh
	scripts/build-deb.sh
undeploy:
	scripts/undeploy.sh

build-rpm: clean
	./scripts/shellcheck.sh
	scripts/build-rpms.sh

un-all: undeploy clean
all-deb: clean set-version build-deb deb-install
all-rpm: clean set-version build-rpm rpm-install

commit:
	scripts/git-commit-and-push.sh

release:
	scripts/release.sh

deb-install:
	apt install ./*.deb
deb-uninstall:
	apt remove -y siakhooi-fileutils
rpm-install:
	rpm -i ./*.rpm
rpm-uninstall:
	rpm -e siakhooi-fileutils
