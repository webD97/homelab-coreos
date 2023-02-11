# Fedora CoreOS with k3s
This projects creates a custom live ISO for Fedora CoreOS that installs CoreOS to a local disk and then installs k3s.

## Steps taken after booting the live ISO
1. CoreOS is installed in to /dev/sda with k3s-install.ign as ignition config
2. The machine is rebooted
3. k3s-install.ign kicks in and installs k3s
4. The machine is rebooted
5. Profit :)