#
# SignalK server setup based on the excellent article by Steve Mitchell on his Seabits.com site:
#
# https://seabits.com/set-up-signal-k-and-grafana-on-raspberry-pi-with-pican-m-nmea-2000-board/
#
#I'll eventually get this to unattended running script, for now it's the set of interactive instructions
#

sudo apt-get update

sudo apt-get full-upgrade

sudo hostnamectl set-hostname

# Set timezone interactively
#
sudo dpkg-reconfigure tzdata
#
# Set timezone programmatically in production
#
# echo "America/New_York" | sudo tee /etc/timezone
# sudo dpkg-reconfigure -f noninteractive tzdata
#
#
# Configure for unattended updates
#
sudo apt-get install unattended-upgrades -y
#
# Future - automate this step
#
sudo dpkg-reconfigure --priority=low unattended-upgrades
#
# Install Required Tools: Ensure curl is installed (sudo apt install curl).
# Obtain Pushover Keys: Get your User Key and create an Application API Token from the Pushover website.
# Configure Unattended Upgrades: Edit /etc/apt/apt.conf.d/50unattended-upgrades to ensure reports are generated:
# Set Unattended-Upgrade::MailReport "on-change"; (or "always" to test).
# Edit upgrade notification script and save to  /usr/local/bin/pushover-notify.sh
# to send the contents of the log file to Pushover using curl.
#
# Future - automate adding the lines below to /boot/firmware/config.txt (sed?)
#
enable_uart=1
dtparam=i2c_arm=on
dtparam=spi=on
dtoverlay=mcp2515-can0,oscillator=16000000,interrupt=25
dtoverlay=spi-bcm2835-overlay
#
# Install software for canbus hat
#
sudo apt-get install can-utils -y
#
# Bring up CANbus / NMEA200 interface
#
sudo /sbin/ip link set can0 up type can bitrate 250000
#
# Add service for CANbus hat
# Future task to automate this set of steps
#
nano socketcan-interface.service
#
#
#
[Unit]
Description=SocketCAN interface can0 with a baudrate of 250000
[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/sbin/ip link set can0 type can bitrate 250000 ; /sbin/ifconfig can0 up
ExecReload=/sbin/ifconfig can0 down ; /sbin/ip link set can0 type can bitrate 250000 ; /sbin/ifconfig can0 up
ExecStop=/sbin/ifconfig can0 down
[Install]
WantedBy=multi-user.target
#
# Finish CANbus service setup
#
sudo cp socketcan-interface.service /etc/systemd/system
sudo chmod 644 /etc/systemd/system/socketcan-interface.service
sudo systemctl enable socketcan-interface.service
#
# Install SignalK
#
sudo apt install nodejs npm -y
sudo npm install -g npm@latest
sudo apt install libnss-mdns avahi-utils libavahi-compat-libdnssd-dev -y
sudo npm install -g --unsafe-perm signalk-server -y
sudo signalk-server-setup
#
# Ran into error with writing Signalk basedelta file if so run touch /home/pi_username/.signalk/baseDeltas.json
#substitute user signalk is running as for pi_username in the above command
#
sudo systemctl edit signalk.service
#
# Add "After=socketcan-interface.service" in the section for the drop in file at the top
#
# Base configuration done now, don't forget to change the SignalK admin user password!
#


