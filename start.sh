docker run -p 8889:8888 -v "$(pwd)/notebooks:/usr/src/app/notebooks" -v "$(pwd)/data:/usr/src/app/data" pyspark-docker
