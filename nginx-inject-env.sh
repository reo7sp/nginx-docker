#!/bin/bash

cd /
rm -rf /etc/nginx-inj
cp -r /etc/nginx /etc/nginx-inj
find /etc/nginx-inj -type f -print0 | while read -d $'\0' file
do
	printenv | while read line
	do
		envname=${line%=*}
		envvalue=${line#*=}
		sed -i "s|\$ENV_$envname|$envvalue|g" $file
	done
	sed -i "s|/etc/nginx|/etc/nginx-inj|g" $file
done

cd /etc/nginx-inj
nginx -c /etc/nginx-inj/nginx.conf -g "daemon off;"
