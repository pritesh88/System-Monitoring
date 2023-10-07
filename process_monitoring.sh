#!/bin/bash

: '   
    TITLE : Process Monioring
    AUTHOR : Pritesh Lad
    Date: 20TH Sep 2023
'

process_name="Monitoring"

pinfo=$(pgrep -f "$process_name")

if [ -z "$pinfo" ]; then
    echo "Process '$process_name' is not running."
    exit 1
fi

# Get CPU usage and memory usage of the process
cpu_usage=$(ps -p "$pinfo" -o %cpu | tail -n 1)
memory_usage=$(ps -p "$pinfo" -o %mem | tail -n 1)

# Compare CPU and memory usage to the threshold values
cpu_threshold=70
memory_threshold=75

if (( $(echo "$cpu_usage > $cpu_threshold" | bc -l) )); then
    if (( $(echo "$memory_usage > $memory_threshold" | bc -l) )); then
        # Send an email report
        echo "CPU usage for process '$process_name' is $cpu_usage%"
        echo "Memory usage for process '$process_name' is $memory_usage%"
        echo "Sending an email report..."

        # Replace the following line with your email sending command
        # Example using 'mail' command:
        # echo "Message body" | mail -s "Subject" your_email@example.com

        echo "Email sent."
    fi
fi