#!/bin/sh
XMLFILE=/data/xmltv.xml
CONFFILE=/config/tv_grab_fr_telerama.conf
GRABBERFILE="usr/local/bin/tv_grab_fr_telerama

[ -f "$CONFFILE" ] || echo -e "yes\nall" | "$GRABBERFILE" --configure --config-file "$CONFFILE"

REFERENCEDATE=$((`date +%s` - 86400 ))                                                                                                                                              
[  -f "$XMLFILE" ] && XMLFILEDATE=`stat -c "%Y" "$XMLFILE"` || XMLFILEDATE=0
if [ $XMLFILEDATE -le $REFERENCEDATE ]; then
   "$GRABBERFILE" --config-file "$CONFFILE" --output "$XMLFILE".new && mv "$XMLFILE".new "$XMLFILE" || rm "$XMLFILE".new
fi
