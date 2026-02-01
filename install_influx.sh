sudo apt update && sudo apt upgrade -y
wget -qO- https://repos.influxdata.com/influxdb.key | gpg --dearmor | sudo tee /usr/share/keyrings/influx-archive-keyring.gpg >/dev/null

