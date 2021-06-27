#!/bin/sh

# initial init
[ -f /data/xmltv.xml ] || /start.sh

# Background process
/usr/sbin/crond

# Front process
/usr/sbin/nginx -g 'daemon off;'
