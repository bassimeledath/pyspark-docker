# pyspark-docker
Dockerized Jupyter environment with PySpark support

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)

# Getting Started

Follow these instructions to get your Jupyter PySpark environment up and running.

## 1. Clone the Repository

Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/bassimeledath/pyspark-docker.git
cd pyspark-docker
```

## 2. Build the Docker Image

**Note**: The first time you build the Docker image, it will take a while to complete (approximately 15 minutes). Fortunately, you only need to build the image once, unless you need to make changes to the docker file.

Ensure that Docker is running on your system before building the image. You can start Docker by opening the Docker Desktop application or using the system's service management commands (e.g., systemctl start docker for Linux). Once Docker is running, build the Docker image from the Dockerfile provided:

```bash
docker build -t pyspark-docker .
```

## 3. Run the Docker Container
Use the provided start.sh script to run the Docker container:

```bash
./start.sh
```

If you get a permission denied error, try running the following command and then try again:

```bash
chmod +x start.sh
```

## 4. Access the Jupyter Notebook
Once the Docker container is running, you can access the Jupyter Notebook by navigating to the following URL in your browser:

```bash
http://localhost:8889
```

## 5. Installing Python Packages
Use the provided install_package.sh script to install Python packages in the Docker container:

```bash
./install_package.sh <package_name>[==<version>]
```
For example to install the latest version of pandas, you would run the following command:

```bash
./install_package.sh pandas
```
Or to install a specific version of pandas, you would run the following command:

```bash
./install_package.sh pandas==1.0.3
```
If you get a permission denied error, try running the following command and then try again:

```bash
chmod +x install_package.sh
```

*Please note*, the newly installed package will only be available in the current container. If you stop the container and start it again, you will need to reinstall the package. If you want to make the package available in all containers, you will need to update the `Dockerfile` and rebuild the image. You can rebuild the image by running the following command:

```bash
docker build -t pyspark-docker:latest .
```

## 6. Stop the Docker Container
Use the provided stop.sh script to stop the Docker container:

```bash
./stop.sh
```

If you get a permission denied error, try running the following command and then try again:

```bash
chmod +x stop.sh
```

# Workflow (IMPORTANT)

The following is a typical workflow for using this Dockerized Jupyter environment:

1. Start the Docker container using the start.sh script.
2. Add jupyter notebooks to the notebooks directory and data to the data directory as needed.
3. Access the Jupyter Notebook in your browser at http://localhost:8889.
4. Install a package using the install_package.sh script.
5. Stop the Docker container using the stop.sh script.




