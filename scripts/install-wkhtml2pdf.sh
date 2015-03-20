#!/bin/sh

# WKHTML2PDF
wget http://kent.dl.sourceforge.net/project/wkhtmltopdf/0.12.2.1/wkhtmltox-0.12.2.1_linux-centos6-amd64.rpm
yum localinstall -y wkhtmltox-0.12.2.1_linux-centos6-amd64.rpm
rm wkhtmltox-0.12.2.1_linux-centos6-amd64.rpm

# Fonts
yum install -y \
    xorg-x11-fonts-Type1 msttcorefonts \
    liberation-fonts liberation-fonts-common \
    liberation-sans-fonts liberation-mono-fonts \
    liberation-serif-fonts

#wget http://www.my-guides.net/en/images/stories/fedora12/msttcore-fonts-2.0-3.noarch.rpm
#rpm -Uvh msttcore-fonts-2.0-3.noarch.rpm