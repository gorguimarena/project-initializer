FROM php:8.2-fpm

# Installer les dépendances système nécessaires
RUN apt-get update && \
    apt-get install -y \
        unzip \
        curl \
        libpq-dev \
        libyaml-dev && \
    docker-php-ext-install pdo pdo_pgsql

# Installer Composer globalement
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Définir le dossier de travail dans le conteneur
WORKDIR /var/www/html

# Copier les fichiers du projet dans le conteneur
COPY . .

# Installer les dépendances PHP avec Composer
RUN composer install --no-dev --optimize-autoloader || true
