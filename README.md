# OpenVPN User Monitoring
This script monitors VPN users and sends notifications to Telegram. It helps network administrators track VPN user activity in real-time.
## Requirement
1. OpenVPN Server
2. TELEGRAM_TOKEN: Telegram API token.
3. CHAT_ID: Telegram chat ID for notifications.
### Git Clone
```
git clone https://github.com/ForensicID/vpn-user.git
```
### Adding Execute Permission
```
chmod +x /path/to/your/directory/vpn_user.sh
```
### Run Script for Background Process
```
bash /path/to/your/directory/vpn_user.sh &
```
### Stop the Script
Get the PID
```
ps aux | grep vpn_user.sh
```
And then Kill the process
```
kill -9 PID
```
## Optional
### If Run Automatically Script on Booting
Open Cronjob configuration
```
crontab -e
```
Adding start the script on Booting Process
```
@reboot bash /path/to/your/directory/vpn_user.sh &
```
### OR Adding in systemd
Create file with your file editor
```
nano /etc/systemd/system/yourServiceName.service
```
Adding some configuration for systemd service
```
[Unit]
Description=Script VPN User Service
After=network.target

[Service]
ExecStart=/path/to/your/directory/vpn_user.sh
User=root
Group=root
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
Reload the Daemon service for change configuration
```
systemctl daemon-reload
```
And then enable and start the vpn user systemd service
```
systemctl enable yourServiceName.service
systemctl start yourServiceName.service
systemctl status yourServiceName.service
```