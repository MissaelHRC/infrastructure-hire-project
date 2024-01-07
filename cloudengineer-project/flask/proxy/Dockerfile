# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY flask/app/app.py /app/

# Install the required dependencies
RUN pip install Flask boto3

# Expose the port that Flask will run on
EXPOSE 8001

# Define the command to run your application
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=8001"]
