## Installation

**Configuration**

Set the environment variables into the .env file:

`mv .env.example .env`

`vi .env`

- TRANSMISSION_CONFIG_DIR: Host absolute path to the config directory (should contains at least settings.json)
- TORRENT_DOWNLOAD_DIR: Host absolute path to your download folder (where torrents will be stored)
- NGINX_WEB_DIR: Host absolute path to the www directory (root directory for hyour webserver)
- NGINX_WEB_SECRETS: Host absolute path to the directory that contains the ssl certificates + htpasswd file

**Deploy**

Run the following commands:

`source config`

`docker-compose up`

## FAQ
### Generate SSL Certificate in local

bash command:

`openssl req -x509 -newkey rsa:4096 -sha256 -out server.crt -keyout server.key -days 365 -nodes`