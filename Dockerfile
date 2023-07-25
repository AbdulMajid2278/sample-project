# Use a base image with Python and necessary tools pre-installed
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy the website code and requirements file to the container
COPY requirements.txt /app/
COPY . /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that Gunicorn will listen on (e.g., 8000)
EXPOSE 8000

# Command to run Gunicorn (adjust the arguments as per your Django project)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "DJANGO-TODO-LIST.wsgi:application"]
