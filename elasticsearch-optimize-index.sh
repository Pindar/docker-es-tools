#!/bin/sh

# COPY of http://pastebin.com/zC9HU2pU
# Do elasticsearch optimize on logstash previous day index
# if $1 = all then optimize all indicies

ELASTICSEARCH=${ELASTICSEARCH:-"http://localhost:9200"}

esindex=`curl -s "$ELASTICSEARCH/_status?pretty=true" | grep $GREP | grep -v \"index\" | sort -r | awk -F\" {'print $2'}`
# Grab yesterday's values
D=`date +%d -d yesterday`
M=`date +%m -d yesterday`
Y=`date +%Y -d yesterday`
today="`date +%Y`.`date +%m`.`date +%d`"
yesterday="$Y.$M.$D"

# If $1 = all
if [ "x$1" = "xall" ]
then
    # Loop through all ES indicies except today
    for index in `ls $esindex | grep -v "$today"`
    do
        # Run through all the indicies and optimize them
        echo "Optimizing $index"
        curl -XPOST "$ELASTICSEARCH/$index/_optimize?max_num_segments=2"
    done
else
    echo "Optimizing index logstash-$yesterday"
    curl -XPOST "$ELASTICSEARCH/logstash-$yesterday/_optimize?max_num_segments=2"
fi
