#!/bin/bash

cd /
rm -rf /etc/nginx-inj
cp -r /etc/nginx /etc/nginx-inj
find /etc/nginx-inj -type f | while read file
do
	printenv | cut -f1 -d"=" | awk '{ print length($0) " " $0; }' | sort -r -n | cut -d ' ' -f 2- | while read envname
	do
		envvalue=${!envname}
		sed -i "s|\$ENV_$envname|$envvalue|g" $file
	done
	sed -i "s|/etc/nginx|/etc/nginx-inj|g" $file
done

cd /etc/nginx-inj
nginx -c /etc/nginx-inj/nginx.conf -g "daemon off;"
