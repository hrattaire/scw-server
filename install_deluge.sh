apt-get update
apt-get install deluge deluge-web deluged

# Creation user deluge
adduser --system  --gecos "Deluge Service" --disabled-password --group --home /var/lib/deluge deluge

# Command below to add user to access deluge files
# sudo adduser <username> deluge

mv deluged.service /etc/systemd/system
mkdir /etc/systemd/system/deluged.service.d/

mv user.conf /etc/systemd/system/deluged.service.d

sudo systemctl enable /etc/systemd/system/deluged.service
sudo systemctl start deluged
sudo systemctl status deluged

mv deluge-web.service /etc/system/system
mkdir /etc/systemd/system/deluge-web.service.d

mv user-deluge-web.conf /etc/systemd/system/deluge-web.service.d/user.conf

sudo systemctl enable /etc/systemd/system/deluge-web.service
sudo systemctl start deluge-web
sudo systemctl status deluge-web

