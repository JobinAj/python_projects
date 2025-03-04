# Use a slim Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install necessary system libraries for audio and GUI support
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libglib2.0-dev \
    libsdl2-mixer-2.0-0 \
    alsa-utils \
    pulseaudio \
    xvfb  # Add virtual display support
    && rm -rf /var/lib/apt/lists/*

# Copy only necessary files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set the correct working directory
WORKDIR /app/1_snake_game

# Copy the `1_snake_game` folder properly
COPY 1_snake_game /app/1_snake_game

# Set environment variables to fix XDG_RUNTIME_DIR issues
ENV SDL_AUDIODRIVER=pulseaudio
ENV XDG_RUNTIME_DIR=/tmp
ENV DISPLAY=:99  # Use xvfb virtual display

# Start the virtual display and run the game
CMD ["bash", "-c", "Xvfb :99 -screen 0 1024x768x16 & python 7_final_code_background_music_image.py"]
