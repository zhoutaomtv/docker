#!/bin/bash

BASEDIR=/var/www/html
# extract and initialize zenphoto if not present
if [ ! -d $BASEDIR/zp-core ]
then
	rm $BASEDIR/index.html
	# extract zenphoto files
	/bin/tar xfz /zenphoto.tgz -C $BASEDIR --strip-components=1
	# create config
	/bin/cp $BASEDIR/zp-core/zenphoto_cfg.txt $BASEDIR/zp-data/zenphoto.cfg.php
	mkdir $BASEDIR/cache
	mkdir $BASEDIR/cache_html
	chown www-data $BASEDIR/albums
	chown www-data $BASEDIR/uploaded
	chown www-data $BASEDIR/zp-data
	chown www-data $BASEDIR/plugins
	chown www-data $BASEDIR/cache
	chown www-data $BASEDIR/cache_html
fi

# run apache in foreground
/usr/sbin/apachectl -D FOREGROUND

