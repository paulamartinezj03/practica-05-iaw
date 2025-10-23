#!/bin/bash
set -ex
#Importamos el archivo .env
source .env
#Realizamos la instalación y actualización de snapd y nginx
snap install core
snap refresh core
#Eliminamos cualquier versión anterior de certbot
apt remove certbot -y
# Instalamos cliente Certbot con snapd
snap install --classic certbot
# Obtenemos el certificado y configuramos el servidor Apache
sudo certbot --apache -m $CERTBOT_EMAIL --agree-tos --no-eff-email -d $CERTBOT_DOMAIN --non-interactive