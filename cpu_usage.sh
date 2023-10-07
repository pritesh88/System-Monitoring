#!/bin/bash

'   CPU USAGE MONITORING 
    Author: Pritesh lad
    Date: 20TH Sep 2023
'
function cpu_stats {
    echo "*******************************************"
    echo "*************** CPU USAGE *****************"
    echo "*******************************************"

    ps -eocomm,pcpu | grep -E -v '(10.0)|(%CPU)' >>"$1".txt

}
