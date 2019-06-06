#!/bin/sh
export LD_LIBRARY_PATH=:/ysdisk/ysapps/pbxcenter/lib/:/ysdisk/ysapps/autoprovision/lib/:/ysdisk/ysapps/linkus/lib/:/ysdisk/ysapps/pbxcenter/lib
for queue in `asterisk -rx "queue show" | grep strategy | awk '{print $1}'`; do
for agent in `asterisk -rx "queue show $queue" | grep Local | awk '{print $1}'`; do
asterisk -rx "queue remove member $agent from $queue"
agent1=`echo $agent | cut -c 7- | cut -c1-3`
queue1=`echo $agent | sed 's/.*\(.\{4\}\)$/\1/'`
asterisk -rx "devstate change Custom:QueueLogin_$queue1*$agent1 NOT_INUSE"
done
done