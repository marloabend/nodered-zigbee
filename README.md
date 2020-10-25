# nodered-zigbee

## Prequisites

In some cases you need to add the current user to the `dialout` group

`sudo usermod -aG dialout $USER`

### Configuring Raspbian for RaspBee

Raspbian defaults Bluetooth to `/dev/ttyAMA0` and configures a login shell over serial (tty). You must disable the tty login shell and enable the serial port hardware, and swap Bluetooth to `/dev/S0`, to allow RaspBee to work properly under Docker.

#### To disable the login shell over serial and enable the serial port hardware:

`sudo raspi-config`

Interfacing Options > Serial

“Would you like a login shell to be accessible over serial?” > No

“Would you like the serial port hardware to be enabled?” > Yes

Exit raspi-config and reboot

#### To swap Bluetooth to /dev/S0 (moving RaspBee to /dev/ttyAMA0), run the following command and then reboot:

`echo 'dtoverlay=pi3-miniuart-bt' | sudo tee -a /boot/config.txt`

After running the above command and rebooting, RaspBee should be available at /dev/ttyAMA0.
