#!/bin/sh
unicorn_pid=`cat /tmp/pids/unicorn.pid`
echo "Restarting Unicorn ($unicorn_pid)"
kill -HUP $unicorn_pid
