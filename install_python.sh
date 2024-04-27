#!/bin/bash

# Install development tools
yum groupinstall "Development Tools" -y

# Install necessary dependencies
yum install gcc bzip2-devel libffi-devel -y wget -y

# Install OpenSSL 1.1 and its development files
yum install openssl openssl-devel -y

# Download Python source
wget https://www.python.org/ftp/python/3.12.2/Python-3.12.2.tgz

# Extract Python source
tar xzf Python-3.12.2.tgz

# Navigate into the extracted directory
cd Python-3.12.2

# Configure Python build with OpenSSL 1.1
./configure --with-openssl=/usr/lib64/openssl11

# Configure Python build with optimizations
./configure --enable-optimizations

# Build and install Python
make
make install

# Download get-pip.py
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# Install pip for Python 3.12
python3.12 get-pip.py

# Check pip version
pip3.12 --version
