## Project Description

This project sets up a Docker environment based on the official Amazon Linux image. It installs Python, along with its dependencies, using a bash script. The installed Python dependencies are then zipped and stored in a volume for persistence and then outputted to the host computer ready to be used-by/uploaded-to AWS Lambda Layer.

## Project Structure

- **Dockerfile**: Defines the Docker image build instructions, including updating package repositories, installing necessary packages, copying files, setting working directory, installing Python and its dependencies, zipping dependencies, and defining a volume.
  
- **install_python.sh**: Bash script responsible for installing Python and its dependencies. It installs development tools, necessary dependencies, downloads and extracts Python source, configures the Python build with OpenSSL, builds/compiles and installs Python, downloads get-pip.py, installs pip for Python 3.12, and checks the pip version.

- **output.sh**: Script to build the Docker image and run a container with a volume mounted, then copy the zipped dependencies from the container to the host machine.

- **requirements.txt**: File containing Python dependencies required by the project. Currently includes `requests`. Edit it to put the library you desire to package for AWS Lambda Layer.

- **teardown.sh**: Script to remove the Docker image and volume created during the project.

## Instructions

1. **Building the Docker Image**:
   
   Run the following command to build the Docker image:
   ```Bash
   sh output.sh
   ```


2. **Teardown**:

    To remove the Docker image and volume created during the project, execute the following command:
    ```Bash
    sh teardown.sh
    ```


**PS:** Ensure that you have Docker installed and configured on your system before running the provided scripts.

**Output:**
![alt text](<output_screenshot.png>)



