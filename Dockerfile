  # The base image
  FROM debian:stretch
  
  # Install python and pip
  RUN apt-get update -y
  RUN apt-get upgrade -y
  RUN apt-get install -y python-pip python-dev build-essential

  COPY requirements.txt /usr/src/app/

  #Install dependencies
  # can also use workdir
  RUN pip install -r /usr/src/app/requirements.txt

  # Copy files required for the app to run
  COPY . /usr/src/app/

  # Declare the port number the container should expose
  EXPOSE 5000

  # Run the application
  CMD ["python", "/usr/src/app/run.py"]
