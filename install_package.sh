#!/bin/bash

# Check if the package name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: ./install_package.sh <package_name>[==<version>]"
  exit 1
fi

# Run pip install inside the running container
docker exec -it pyspark-docker-container pip install "$1"
