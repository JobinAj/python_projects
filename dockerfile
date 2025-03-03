FROM python:3.9-slim

WORKDIR /app

# Copy only necessary files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the `1_snake_game` folder properly
COPY 1_snake_game /app/1_snake_game

# Set the correct working directory
WORKDIR /app/1_snake_game

# Run the correct script
CMD ["python", "7_final_code_background_music_image.py"]
