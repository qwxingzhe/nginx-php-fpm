#!/bin/bash

cd /var/www/depend_file

apt-get update

tar xvfJ wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
sudo mv ./wkhtmltoimage /usr/bin/wkhtmltoimage
cd wkhtmltox/bin
cp wkhtmlto* /usr/bin/
sudo chmod +x /usr/bin/wkhtmltoimage
sudo chmod +x /usr/bin/wkhtmltopdf

sudo apt-get install libXext*
sudo apt-get install libfontconfig*
apt-get install libXrender*
sudo apt install libssl1.0-dev

apt-get  install urw-fonts
apt-get  install fontconfig libXrender libXext xorg-x11-fonts-Type1 xorg-x11-fonts-75dpi freetype libpng zlib libjpeg-turbo openssl

rm -rf /var/www/depend_file

tail -f /dev/null
