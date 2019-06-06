#!/bin/sh
export LD_LIBRARY_PATH=:/ysdisk/ysapps/pbxcenter/lib/:/ysdisk/ysapps/autoprovision/lib/:/ysdisk/ysapps/linkus/lib/:/ysdisk/ysapps/pbxcenter/lib
for agent in `asterisk -rx "queue show queue-$1" | grep Local | awk '{print $1}'`; do
asterisk -rx "queue remove member $agent from $queue"
agent1=`echo $agent | cut -c 7- | cut -c1-3`
asterisk -rx "devstate change Custom:QueueLogin_$1*$agent1 NOT_INUSE"
done
