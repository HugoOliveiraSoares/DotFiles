#!/bin/sh

is_powered=$(bluetoothctl show | grep "Powered" | cut -d' ' -f2)

if [ $is_powered = "yes" ]; then
    printf ''
    devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f2)
    counter=0

    echo "$devices_paired" | while read -r line; do
        device_info=$(bluetoothctl info "$line")

        if echo "$device_info" | grep -q "Connected: yes"; then
            device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f2-)

            if [ $counter -gt 0 ]; then
                printf ", %s" "$device_alias"
            else
                printf " %s" "$device_alias"
            fi

            counter=$((counter + 1))
        fi
    done
    #echo -e "\n"
else
    echo ""
fi