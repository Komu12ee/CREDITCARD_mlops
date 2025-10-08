# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Copy application files
COPY app.py requirements.txt model.joblib /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variable for Azure Web App port
ENV PORT 80

# Run uvicorn as production server
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
