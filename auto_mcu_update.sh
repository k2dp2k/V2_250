#!/bin/sh

sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.spider
make KCONFIG_CONFIG=config.spider
./scripts/flash-sdcard.sh /dev/ttyAMA0 fysetc-spider-v1

make clean KCONFIG_CONFIG=config.rpi
make KCONFIG_CONFIG=config.rpi
make flash KCONFIG_CONFIG=config.rpi

sudo service klipper start