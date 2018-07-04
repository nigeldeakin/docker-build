FROM alpine

ARG SOME_ARG

RUN cat /etc/resolv.conf
RUN nslookup google.com
RUN nslookup cambridge.gov.uk `cat /etc/resolv.conf | grep nameserver | head -1 |  awk '{print $2}'`
RUN ping -c 3 172.217.5.238
RUN ping  -c 3 google.com
RUN apk --no-cache add curl
RUN curl google.com

RUN cat /etc/resolv.conf
RUN nslookup cambridge.gov.uk
RUN ping -c 3 cambridge.gov.uk
RUN ping -c 3 192.124.249.109

