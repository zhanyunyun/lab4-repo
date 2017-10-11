############################################################

# Dockerfile to build Python WSGI Application Containers

# Based on Ubuntu

############################################################

# Set the base image to Ubuntu

FROM ubuntu:latest

# File Author / Maintainer

MAINTAINER MBasel  Magableh



# Update the sources list

RUN apt-get update

# Install Python and Basic Python Tools

RUN apt-get install -y python3 python3-pip mysql-client libmysqlclient-dev

#copy app.py into /app folder 

ADD /myapp /myapp



# Copy the application folder inside the container

#COPY /templates /app/

# Upgrade  PIP

RUN pip3 install --upgrade pip

# Get pip to download and install requirements:

RUN pip3 install -r /myapp/requirements.txt

# Expose ports

EXPOSE 5000

# Set the default directory where CMD will execute

WORKDIR /myapp

# Set the default command to execute

# when creating a new container

# i.e. using Flask to serve the application

CMD python3 app.py
