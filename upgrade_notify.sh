curl -s -F-token=YOUR_APP_TOKEN \
-F-user=YOUR_USER_KEY \
-F-message="$(cat /var/log/unattended-upgrades/unattended-upgrades.log)" \
-F-title="Unattended Upgrades: $(hostname)" \
https://api.pushover.net/1/messages.json
