# Use official Python image
FROM python:3.10

# Set the working directory inside the container
WORKDIR /app

# Copy all files, including the resources folder
COPY . .

# Install dependencies
RUN pip install pygame

# Run the final game script
CMD ["python", "7_final_code_background_music_image.py"]
