# Install Distrobox
`sudo apt install distrobox podman`

# Images installieren
## Intel
`distrobox create -a "--platform=linux/amd64" -i docker.io/library/ubuntu:25.04 -n ubuntu-25`

## ARM64
`distrobox create -a "--platform=linux/arm64" -i docker.io/library/ubuntu:25.04 -n ubuntu-25-arm64`

`distrobox create -a "--platform=linux/arm64" -i debian -n debian-arm64`

## RISC-V
`distrobox create -a "--platform=linux/riscv64" -i docker.io/library/ubuntu:25.04 -n ubuntu-riscv`



Evtl, nur für arm
`sudo apt install qemu-system qemu-user-static binfmt-support`

Distroboxen auflisten:
`distrobox list`

Distrobox starten:_
`distrobox enter [images]` ( erster Start geht sehr lang )


### Prozesse auflisten
`podman logs -f [images]`



sudo apt install libadwaita-1-dev 

## Version Abfrage
pkg-config --modversion glib-2.0



# Distrobox Tips


## {TAB} für Packetauswahl
sudo apt install bash-completion
sudo rm /etc/apt/apt.conf.d/docker-clean
sudo apt update

## NAS verbinden
sudo ln var/run/host/n4800/ n4800 -s


## OS abfragen
cat /etc/os-release


