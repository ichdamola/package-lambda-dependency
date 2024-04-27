# Use the official Amazon Linux Docker image
FROM amazonlinux:latest

# Update package repositories and install necessary packages
RUN yum update -y

# Set the working directory
WORKDIR /usr/src

# Copy the bash script and requirements file into the container
COPY install_python.sh .
COPY requirements.txt .

# Make the bash script executable
RUN chmod +x install_python.sh

# Run the bash script to install Python
RUN ./install_python.sh

# Install Python dependencies into 'modules' directory
RUN pip3.12 install -r requirements.txt -t /usr/src/modules/

# Zip up the installed dependencies
RUN zip -9r /usr/src/modules.zip /usr/src/modules

# Declare a volume to persist data
VOLUME /usr/src/data

# Move modules.zip to the volume
CMD ["mv", "/usr/src/modules.zip", "/usr/src/data/"]