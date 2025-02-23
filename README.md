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

3. Copy the env file

`cp .env.template .env`

4. Modify the environment variables to suit your deployment
`nano .env`

`docker compose up -d`

5. Visit the IP address of your virtual machine UNSECURED using HTTP and ensure your home page exists (e.g., http://123.456.7.89)

6. Set up Domains between GCP and Registrar (Siteground is used in the video tutorial)
ONCE DNS Zones and Nameservers are linked between GCP and Siteground/registrar, Run docker compose to get the certificates

7. Once you've verified that your site is up and running at the unsecured (HTTP) domain (i.e., http://yourdomain.com), then remove the containers and recreate them to receive your certificates

`docker rm $(docker ps -aq) -f`

`docker compose up`

8. Exit the containers using Control + C, and then remove them (certificates have been received, but NGINX is still not running via SSL due to configuration file contents; certificates WILL persist)

`docker rm $(docker ps -aq) -f`

10. Run the docker containers in the background for the "real world" setup

`docker compose up -d`

12. Navigate to https://yourdomain.com to verify that you're running using SSL/HTTPS!
