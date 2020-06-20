sudo apt-get update
sudo apt-get install deluge deluge-web deluged

# Creation user deluge
sudo adduser --system  --gecos "Deluge Service" --disabled-password --group --home /var/lib/deluge deluge

# Command below to add user to access deluge files
# sudo adduser <username> deluge


