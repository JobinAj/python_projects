FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install pygame
CMD ["python", "8_final_code_background_music.py"]
