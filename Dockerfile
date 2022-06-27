# FROM php:8-apache
FROM php:8-apache@sha256:8b9f42dde527854af5457db62c9fa096f9db8d1b5e5dd6a5c58cddc7c2ec6069

RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql

COPY . /var/www/html
WORKDIR /var/www/html
# CMD [ "php", "./your-script.php" ]