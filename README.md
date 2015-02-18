docker-php-for-wordpress
================

Base docker image to run Wordpress (Apache with all php extensions for wordpress installed)

Running the docker image
------------------------------------

Start the image binding the external port 80, with your own php code in `/your-code-folder` and a container running mysql named `your-mysql-container`:

    docker run -d -p 80:80 --name docker-php-for-wordpress \
        --link your-mysql-container:mysql \
        --volume /your-code-folder:/var/www/html \
        benoitvallon/docker-php-for-wordpress

Running the docker image with docker-compose
------------------------------------

    yourprestashop:
        image: benoitvallon/docker-php-for-wordpress
        restart: always
        ports:
          - "80:80"
        links:
          - your-mysql-container:mysql
        volumes:
          - /your-code-folder:/var/www/html

Adding mail support with ssmtp
------------------------------------

If you want the support of mails with ssmtp, you can mount your ssmtp configuration files with a volume.

    --volume /your-ssmtp-configuration-folder:/etc/ssmtp


Building the base image
-----------------------

To create the base image `docker-php-for-wordpress`, execute the following command on the docker-php-for-wordpress folder after a git clone on the repo:

    docker build -t docker-php-for-wordpress .
