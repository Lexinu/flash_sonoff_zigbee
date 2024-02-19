#!/bin/bash

python cc2538-bsl.py \
    -p /dev/ttyUSB0 \
    -e -v -w --bootloader-sonoff-usb \
    firmware.hex
