#!/bin/bash

# RUN AS ROOT
if [ "$(id -u)" -ne 0 ]; then echo "Please run as root." >&2; exit 1; fi
exit 2;

apt update

# HEIF / HEIC support
apt install heif-gdk-pixbuf

# May be neede for HEIF / HEIC thumbnails support
# apt install heif-thumbnailer

# VIM
apt install vim

# Shell intro + fancy reporting
apt install fortune
apt install cowsay
# apt install toilet
# apt install figlet

# Sytem details
apt install inxi