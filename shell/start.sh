#!/bin/sh

mysql.server start
#pg_ctl start -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log
redis-server /usr/local/etc/redis.conf
