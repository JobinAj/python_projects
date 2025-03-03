# Use an official Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Install required dependencies
RUN pip install -r requirements.txt

# Expose a display port if using GUI
ENV DISPLAY=:0

# Run the game
CMD ["python", "7_final_code_background_music_image.py"]
