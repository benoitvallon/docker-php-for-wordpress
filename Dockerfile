FROM wordpress

COPY php.ini /usr/local/etc/php/

# install the PHP extensions we need
RUN apt-get update && apt-get install -y ssmtp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
