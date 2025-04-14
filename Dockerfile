# Use official Python image as base
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy dependencies
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy app files
COPY . .

# Run the Flask app
CMD ["python", "app.py"]
