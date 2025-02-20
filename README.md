## Setup

Before getting started: Make sure that APACHE or on-VM NGINX aren't installed. Google cloud sometimes comes with apache installed by default.

`sudo systemctl stop apache2`

`sudo systemctl disable apache2`

`sudo apt remove --purge apache2 -y` 

`sudo apt autoremove -y`


1. Git clone the repository

`git clone https://github.com/geoace/certbot-nginx.git`

`cd certbot-nginx`

2. make startup executable 

`chmod +x start-nginx.sh`

3. Make conf directories

mkdir conf

3. Copy the env file

`cp .env.template .env`

4. Modify the environment variables to suit your deployment

`nano .env`

5. `docker compose up -d`
