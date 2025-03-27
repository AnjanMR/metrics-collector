#!/bin/sh
i=1;
while(true)
do 
sed "s/SERVICE_ID/$1/g;" /root/metrics-collector/metrics-template.script > /root/metrics-collector/metrics.script
nw-shell @/root/metrics-collector/metrics.script >> /var/log/event-streaming-service/resultfiles/metrics_$i.txt
awk 'NR > 13 { print }' < /var/log/event-streaming-service/resultfiles/metrics_$i.txt > /var/log/event-streaming-service/resultfiles/metrics_$i.json

sed "s/SERVICE_ID/$1/g;" /root/metrics-collector/rule-metrics-template.script > /root/metrics-collector/rule-metrics.script
nw-shell @/root/metrics-collector/rule-metrics.script >> /var/log/event-streaming-service/resultfiles/rule-metrics_$i.txt
awk 'NR > 13 { print }' < /var/log/event-streaming-service/resultfiles/rule-metrics_$i.txt > /var/log/event-streaming-service/resultfiles/rule-metrics_$i.json 

sleep 5m

i=`expr $i + 1`;

done
