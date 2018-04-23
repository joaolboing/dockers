FROM conectra/nginx-php-fpm

RUN set -ex \
  && apk --no-cache add \
  postgresql-dev autoconf g++ make

RUN docker-php-ext-install pdo pdo_pgsql

RUN pecl install mongodb \
  && docker-php-ext-enable mongodb

ADD conf/nginx/nginx-site.conf /etc/nginx/sites-available/default.conf

# Php Directives
RUN echo "php_admin_value[max_execution_time] = 1200" >> /usr/local/etc/php-fpm.d/www.conf \
    && echo "php_admin_value[memory_limit] = 128M" >> /usr/local/etc/php-fpm.d/www.conf