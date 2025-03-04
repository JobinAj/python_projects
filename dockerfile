# Use a slim Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install necessary system libraries (including libgthread)
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libglib2.0-dev \
    libsdl2-mixer-2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Copy only necessary files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set the correct working directory
WORKDIR /app/1_snake_game

# Copy the `1_snake_game` folder properly
COPY 1_snake_game /app/1_snake_game

# Run the correct script
CMD ["python", "7_final_code_background_music_image.py"]
