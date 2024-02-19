# Git for new Firmwares:
-> https://github.com/Koenkk/Z-Stack-firmware/tree/master/coordinator/Z-Stack_3.x.0/bin

Update FW_VERSION in Dockerfile to ref new firmware

# Commands:
```bash
docker build . \
    --tag flash_sonoff

docker stop zigbee2mqtt

docker run --rm \
    --name flash_sonoff \
    --device=/dev/serial/by-id/usb-ITead_Sonoff_Zigbee_3.0_USB_Dongle_Plus_7e12a84c8629ec11a6e8757840c9ce8d-if00-port0:/dev/ttyUSB0 \
    flash_sonoff

docker image rm flash_sonoff

docker start zigbee2mqtt
```