#!/bin/sh

#mysqld_safe --skip-grant-tables &
mysql.server start &
#pg_ctl start -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log
redis-server /usr/local/etc/redis.conf
mongod --config /usr/local/etc/mongod.conf
