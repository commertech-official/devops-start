#!/bin/bash

user_dir="/home/aleshkin_da"
work_dir="$user_dir/devops_netology/bash_scripts_auto/work_files"
device_history_file="$work_dir/device_history.log"
device_log_file="$work_dir/device_monitor.log"

if [ ! -d "$work_dir" ]; then
    mkdir -p "$work_dir"
fi

if [ ! -f "$device_history_file" ]; then
    touch "$device_history_file"
fi

if [ ! -f "$device_log_file" ]; then
    touch "$device_log_file"
fi

# read history once
history_once=$(cat "$device_history_file" 2>/dev/null)
new_devices_found=0

if [ -f /proc/bus/input/devices ]; then  
	block=""
	while read -r line; do
		if [ "$line" = "" ]; then
			if [ -n "$block"  ]; then

				id_device=$(echo "$block" | grep "^I:" | sed 's/.*Vendor=\([0-9a-fA-F]*\).*Product=\([0-9a-fA-F]*\).*/\1_\2/')
				name=$(echo "$block" | grep "^N: Name=" | sed 's/^N: Name="\(.*\)"$/\1/')
				handlers=$(echo "$block" | grep "^H: Handlers=" | sed 's/^H: Handlers=\(.*\)$/\1/')
				vendor=$(echo "$block" | grep "^I:" | sed 's/.*Vendor=\([0-9a-fA-F]*\).*/\1/')
				product=$(echo "$block" | grep "^I:" | sed 's/.*Product=\([0-9a-fA-F]*\).*/\1/')	
				# printf "%-34s | %-24s | %-14s | %-14\n" "$name" "$handlers" "$vendor" "$product"
				
				# check, have device in history
				if ! echo "$history_once" | grep -q "^$id_device$"; then
					# new device
					if [ $new_devices_found -eq 0 ]; then
						echo "-----------------------------" >> "$device_log_file"
                        			echo "Start: $(date '+%Y-%m-%d %H:%M:%S')" >> "$device_log_file"
                        			echo "New devices:" >> "$device_log_file"
                        			printf "%-34s | %-24s | %-14s | %-14s\n" "NAME" "HANDLERS" "VENDOR" "PRODUCT" >> "$device_log_file"
                        			new_devices_found=1		
					fi

					printf "%-34s | %-24s | %-14s | %-14s\n" "$name" "$handlers" "$vendor" "$product" >> "$device_log_file"
                    
                    			# add id in history
                    			echo "$id_device" >> "$device_history_file"

				fi

				block=""
			fi
		else
			block="$block$line"$'\n'
		fi

	done < /proc/bus/input/devices

	if [ -n "$block" ]; then

		id_device=$(echo "$block" | grep "^I:" | sed 's/.*Vendor=\([0-9a-fA-F]*\).*Product=\([0-9a-fA-F]*\).*/\1_\2/')
        	name=$(echo "$block" | grep "^N: Name=" | sed 's/^N: Name="\(.*\)"$/\1/')
        	handlers=$(echo "$block" | grep "^H: Handlers=" | sed 's/^H: Handlers=\(.*\)$/\1/')
        	vendor=$(echo "$block" | grep "^I:" | sed 's/.*Vendor=\([0-9a-fA-F]*\).*/\1/')
        	product=$(echo "$block" | grep "^I:" | sed 's/.*Product=\([0-9a-fA-F]*\).*/\1/')
        	 if ! echo "$history_once" | grep -q "^$id_device"; then
            		if [ $new_devices_found -eq 0 ]; then
            			echo "-----------------------------" >> "$device_log_file"
                		echo "Start: $(date '+%Y-%m-%d %H:%M:%S')" >> "$device_log_file"
                		echo "New devices:" >> "$device_log_file"
                		printf "%-34s | %-24s | %-14s | %-14s\n" "NAME" "HANDLERS" "VENDOR" "PRODUCT" >> "$device_log_file"
                		new_devices_found=1
            		fi
            
            	printf "%-34s | %-24s | %-14s | %-14s\n" "$name" "$handlers" "$vendor" "$product" >> "$device_log_file"
            	echo "$id_device" >> "$device_history_file"
            	fi
            fi
fi
