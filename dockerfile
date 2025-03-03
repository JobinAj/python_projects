# Use an official Python image
FROM python:3.9-slim

# Install necessary system dependencies for pygame
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libglib2.0-dev \
    libgthread-2.0-0 \
    libasound2-dev \
    libpulse-dev \
    libx11-6 \
    libxext6 \
    libxrender1 \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Install required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variable to avoid GUI errors
ENV DISPLAY=:0

# Run the game
CMD ["python", "7_final_code_background_music_image.py"]
