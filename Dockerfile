FROM python:alpine3.6

ARG SOME_ARG

#App directory
RUN mkdir /src
WORKDIR /src

RUN cat /etc/resolv.conf
RUN nslookup google.com
RUN ping -c 3 172.217.5.238
RUN ping  -c 3 google.com
RUN apk --no-cache add curl
RUN curl google.com

#Move source into container image
COPY src/ .
#Install app dependencies
RUN pip install -r requirements.txt

#Expose server port
EXPOSE 5000

#...and run this
ENTRYPOINT [ "/usr/local/bin/python" ]
CMD [ "app.py" ]
