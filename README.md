# Python SQL App with Docker Compose

This repository contains a Docker Compose configuration and Dockerfile for a Python application with SQL Server.

## Prerequisites

Before you begin, make sure you have the following installed:

- Docker
- Docker Compose

## Getting Started

1. Clone this repository:

   ```bash
   git clone <repository-url>
   ```

2. Navigate to the project directory:

   ```bash
   cd <project-directory>
   ```

3. Create a `.env` file with the required environment variables. For example:

   ```env
   MSSQL_TCP_PORT=1433
   ```

4. Build and run the Docker containers:

   ```bash
   docker-compose up -d
   ```

   This will build the Python-SQL App image and start the containers.

## Docker Compose Configuration

### Services

- **python-sql-app:**
  - The service for the Python application with SQL Server.
  - Builds from the specified Dockerfile.
  - Sets the image tag based on the repository name and commit ID.
  - Uses environment variables from the `.env` file.

   **Description:** This Docker Compose configuration defines a service for a Python application with SQL Server. It specifies how the Docker image is built, sets the image tag, and utilizes environment variables for configuration.

## Dockerfile

### Base Image

- Uses a smaller base image: `python:3.9-slim-buster`

### System Packages

- Installs required system packages:
  - git
  - gcc
  - curl
  - wget
  - build-essential
  - unixodbc
  - unixodbc-dev

### Microsoft ODBC Driver

- Installs Microsoft ODBC driver for SQL Server.

### Working Directory

- Sets the working directory to `/app`

### Dependencies

- Copies `requirements.txt` and installs the dependencies.

### Application Code

- Copies the entire project directory into the container.

### Exposed Ports (Currently Commented Out)

- Exposes the required ports. Uncomment and adjust if necessary.

### Run Command

- Runs the application with the command `python main.py`

   **Description:** This Dockerfile sets up a Python environment for a SQL Server-connected application. It uses a slim base image, installs necessary system packages, Microsoft ODBC driver, and sets up the application code.

## Environment Variables

- **MSSQL_TCP_PORT:** The TCP port for connecting to MSSQL. It is defined in the `.env` file.
