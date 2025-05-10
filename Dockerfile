FROM python:3.10

LABEL version = "0.1"
LABEL author = ""
LABEL description = "Build image"

# Set working directory in the container
WORKDIR /app

# Install Image dependencies
RUN apt-get update \
    && apt-get install -y git \
    build-essential \
    curl \
    wget \
    pip

# Copy the relevent folders/files into the container
COPY hello.c /app/
COPY hello.cpp /app/
COPY hello.py /app/
COPY requirements.txt /app/

# Install any needed dependencies specified in requirements.txt
#RUN pip install --no-cache-dir -r requirements.txt

# Run script
CMD [ "python", "hello.py" ]
