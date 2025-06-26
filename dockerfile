FROM python:3.13

# Install SSH Client
RUN apt-get update && apt-get install -y openssh-client 

# Set environment variables
# PYTHONUNBUFFERED en 1 activa el modo unbuffered, esto hace que la salida standard y la salida de errores de python se vuelven sin buffer y se escriban inmediatamente en la consola y no en una memoria buffer
ENV PYTHONUNBUFFERED=1 

# Set the working directory
# Esto le indica a dockerfile que nuestra aplicación de django este adentro de un directorio llamado app
WORKDIR /app

# Copy requirements.txt file
# Esto va a copiar el requirements.txt a la carpeta app
COPY requirements.txt /app/requirements.txt

# Install python dependencies
RUN pip install -r requirements.txt

# Copy the application to the working directory
COPY . /app

# Start the SSH tunnel
# Lo escribimos así porque la extension docker DX nos recomiendoa usar un formato JSON
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]