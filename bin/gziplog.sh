#!/bin/bash
suffix=$(date '+%Y-%m-%d-%H%M%S')
dir=$(dirname $(dirname $(readlink -f "$0")))
file_suffix=access.${suffix}*
file_name=access.${suffix}.tar.gz
desc=${dir}/${file_name}
src=${dir}/logs/*.log
log_path=${dir}/${file_suffix}
#gzip log files
tar cvfP ${desc} ${src} 

#log anylasisy
zcat -f ${log_path} | goaccess  -a -o index.html --real-time-html --ws-url=dev.goaccess.com 
