#!/bin/bash
'
    MEMORY USAGE MONITORING 
    Author: Pritesh lad
    Date: 20TH Sep 2023
'

function mem_stats {
    echo "*******************************************"
    echo "*************** MEMORY USAGE *****************"
    echo "*******************************************"

    ps -eocomm,pmem | grep -E -v '(10.0)|(%MEM)' >>"$1".txt

}
