# Adding this for a test of cache management in GitHub Actions. The Dockerfile itself is unchanged.
# another check for cache - what about now? another one.
# Use official Python runtime as base image
FROM python:3.11-slim

# Set working directory in container
WORKDIR /app

# Copy requirements.txt first for better layer caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application
COPY . .

# Expose port 8000
EXPOSE 8000

# Set environment variables
ENV FLASK_APP=server.py
ENV PYTHONUNBUFFERED=1

# Run the application using waitress
CMD ["python", "server.py"]
