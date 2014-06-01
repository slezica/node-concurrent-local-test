#!/bin/bash
PROCS=20
SOCKETS_PER_PROC=1000

coffee server.coffee &

sleep 0.5

for _ in `seq $PROCS`; do
    coffee client.coffee $SOCKETS_PER_PROC &
done

read
pkill -TERM -P $$
