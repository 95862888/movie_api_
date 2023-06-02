# Use a multi-stage build
# Build stage
FROM python:3.10-slim AS build

# Set the working directory to /app
WORKDIR /app

# Copy only the necessary files for the build stage
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
# Use --no-cache-dir to reduce image size
# Use --compile to pre-compile Python files
RUN pip install --no-cache-dir --compile -r requirements.txt

# Runtime stage
FROM python:3.10-slim

# Set the working directory to /app
WORKDIR /app

# Copy the installed packages from the build stage
COPY --from=build /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages

# Copy the application files
COPY . .

# Start the app
CMD ["python3", "main.py"]
