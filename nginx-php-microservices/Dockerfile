FROM conectra/nginx-php-fpm

RUN set -ex \
  && apk --no-cache add \
  postgresql-dev

RUN docker-php-ext-install pdo pdo_pgsql

# Php Directives
RUN echo "php_admin_value[max_execution_time] = 600" >> /usr/local/etc/php-fpm.d/www.conf \
    && echo "php_admin_value[memory_limit] = 128M" >> /usr/local/etc/php-fpm.d/www.conf