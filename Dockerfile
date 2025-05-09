FROM python:3.10
WORKDIR /usr/src
# Start Commands
RUN apt-get update \
    && apt-get install -y git build-essential \
    && /usr/local/bin/python -m pip install --upgrade pip

# Copy the files
COPY hello.c .
COPY hello.cpp .
COPY hello.py .
COPY requirements.txt .

# Install Commands
RUN pip install -r requirements.txt

# Last Commands
