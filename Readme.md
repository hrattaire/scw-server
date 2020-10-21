## Installation

**Clone repo**
```
git clone https://github.com/hrattaire/scw-server.git
```

**Set configuration**
```
cd scw-server
mv config.example config
```
- TORRENT_DOWNLOAD_DIR: Host absolute path to your download folder (where torrents will be stored)
- NGINX_WEB_DIR: Host absolute path to the www directory (root directory for hyour webserver)
- NGINX_WEB_SSL: Host absolute path to the directory that contains the ssl certificates
- NGINX_WEB_RESTRICT: Host absolute path to the directory that contains the htpasswd file

**Set nginx**
```
mv web/nginx.env.example web/nginx.env
```

**Generate stronger DH parameters**
```
openssl dhparam -out web/nginx/dhparam.pem
```


**Deploy**

Run the following commands:

```
./run.sh
```

## FAQ
### Generate SSL Certificate in local

bash command:

`openssl req -x509 -newkey rsa:4096 -sha256 -out server.crt -keyout server.key -days 365 -nodes`