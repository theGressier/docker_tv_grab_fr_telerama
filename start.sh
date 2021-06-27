#!/bin/sh

[ -f /config/tv_grab_fr_telerama.conf ] || echo -e "yes\nall" | tv_grab_fr_telerama --configure --config-file /config/tv_grab_fr_telerama.conf
/usr/local/bin/tv_grab_fr_telerama --config-file /config/tv_grab_fr_telerama.conf --output /data/xmltv.xml
