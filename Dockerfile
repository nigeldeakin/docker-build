FROM python:alpine3.6

MAINTAINER Dave Franco <dave.franco@oracle.com>

#App directory
RUN mkdir /src
WORKDIR /src

#Move source into container image
COPY src/ .
#Install app dependencies
RUN pip install -r requirements.txt

#Expose server port
EXPOSE 5000

#...and run this
ENTRYPOINT [ "/usr/local/bin/python" ]
CMD [ "app.py" ]
