#!/bin/bash

# Install development tools
yum groupinstall "Development Tools" -y

# Install necessary dependencies
yum install -y gcc bzip2-devel libffi-devel openssl openssl-devel wget

# Set Python version
PYTHON_VERSION="3.12.2"

# Download Python source
wget "https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz"

# Extract Python source
tar xzf "Python-${PYTHON_VERSION}.tgz"

# Navigate into the extracted directory
cd "Python-${PYTHON_VERSION}"

# Configure Python build with OpenSSL 1.1
./configure --with-openssl=/usr/lib64/openssl11 --enable-optimizations

# Build and install Python
make && make install

# Download get-pip.py
curl -O "https://bootstrap.pypa.io/get-pip.py"

# Install pip for Python 3.12
python3.12 get-pip.py

# Check pip version
pip3.12 --version
