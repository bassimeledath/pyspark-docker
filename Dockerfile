# Specify the platform (e.g., linux/amd64 for x86_64 architecture)
FROM --platform=linux/amd64 python:3.11.5-slim

# Install wget
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean;

# Install Conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /usr/local/miniconda && \
    rm Miniconda3-latest-Linux-x86_64.sh

# Set the path to Conda
ENV PATH="/usr/local/miniconda/bin:${PATH}"

# Install Java, PySpark, and Jupyter Notebook using Conda
RUN conda install -y -c anaconda openjdk=11
RUN conda install -y -c conda-forge pyspark
RUN conda install -y -c anaconda jupyter

# Set the working directory in the container
WORKDIR /usr/src/app

# Create data and notebooks directories
RUN mkdir data notebooks

# Copy the contents of the local notebooks directory into the Docker image
COPY notebooks/ /usr/src/app/notebooks/

# Copy the contents of the local data directory into the Docker image
COPY data/ /usr/src/app/data/

# Expose the port Jupyter will run on
EXPOSE 8888

# Define the command to run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]
