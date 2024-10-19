# Use a Python base image
FROM python:3.9-slim

# Install required system packages
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy requirements.txt
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose any required ports (if necessary)
# EXPOSE 5000

# Command to run the script
CMD ["python", "app.py"]
