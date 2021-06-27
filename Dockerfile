FROM alpine
VOLUME ["/data","/config"]

RUN apk add --no-cache xmltv perl-json perl-digest-hmac perl-lwp-protocol-https nginx
ADD https://raw.githubusercontent.com/zubrick/tv_grab_fr_telerama/master/tv_grab_fr_telerama /usr/local/bin/
RUN chmod +rx /usr/local/bin/tv_grab_fr_telerama 

RUN mkdir -p /run/nginx
RUN touch /run/nginx/nginx.pid
COPY nginx.conf /etc/nginx/nginx.conf

COPY entrypoint.sh /entrypoint.sh
COPY start.sh /start.sh
RUN ln -s /start.sh /etc/periodic/daily/tv_grab_fr_telerama

EXPOSE 80

CMD /entrypoint.sh
