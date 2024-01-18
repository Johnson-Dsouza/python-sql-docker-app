# Use a smaller base image
FROM python:3.9-slim-buster

# Install the required system packages
RUN apt-get update && \
    apt-get install -y git gcc curl wget build-essential unixodbc unixodbc-dev

# Installation of Microsoft ODBC driver for SQL Server
RUN curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
RUN curl https://packages.microsoft.com/config/debian/10/prod.list | tee /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17

# Set the working directory
WORKDIR /app

# Copy just the requirements file
COPY requirements.txt requirements.txt

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Expose the required ports (currently commented out)
# EXPOSE

# Run the application
CMD ["python", "main.py"]