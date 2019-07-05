  # The base image
  FROM ubuntu:latest

  #Install dependencies
  RUN pip install -r requirements.txt

  # Install python and pip
  RUN apt-get update -y
  RUN apt-get install -y python-pip python-dev build-essential

  #Install dependencies
  RUN pip install -r requirements.txt

  # Copy files required for the app to run
  COPY app.py /usr/src/app/

  # Declare the port number the container should expose
  EXPOSE 5000

  # Run the application
  CMD ["python", "/usr/src/app/app.py"]
