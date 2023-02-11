COREOS_INSTALLER=podman run --rm -v .:/data -w /data quay.io/coreos/coreos-installer:release
BUTANE=podman run --rm -v .:/data -w /data quay.io/coreos/butane:release

.PHONY: default
default: coreos-live.ign
	${COREOS_INSTALLER} download -f iso -s stable -a x86_64
	${COREOS_INSTALLER} iso ignition embed -i coreos-live.ign $(shell find . -name "fedora-coreos-*.iso")

k3s-install.ign: k3s-install.bu
	${BUTANE} --strict --pretty -d . k3s-install.bu > k3s-install.ign

coreos-live.ign: coreos-live.bu k3s-install.ign
	${BUTANE} --strict --pretty -d . coreos-live.bu > coreos-live.ign
