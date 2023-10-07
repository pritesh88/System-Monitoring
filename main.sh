#!/bin/bash
: '   
    TITLE : CPU and Memory usage Monioring
    AUTHOR : Pritesh Lad
    Date: 20TH Sep 2023
'
echo"$HOSTNAME"
source cpu_usage.sh
source memory_usage.sh
source file_op.sh
source email.sh

count=1
while [[ $count -gt 0 ]]; do

  echo "
    Select your choice :
    1.CPU Statistics - Enter CPU/cpu/Cpu
    2.Memory Statistics - Enter MEM/mem/Mem
    3.All (CPU ,Memory) - Enter ALL,all , All 
    4.None - Enter None, none,NONE
    0.Exit

    "

  read -rp "Enter your choice :" choice
  read -rp "Enter output file name : " output_file
  create_file "$output_file" "$choice"

  case $choice in
  1 | cpu | CPU | Cpu)
    cpu_stats "$output_file"
    ;;
  2 | mem | MEM | Mem)
    mem_stats "$output_file"
    ;;
  3 | ALL | all | All)
    cpu_stats "$output_file"
    mem_stats "$output_file"
    ;;
  4 | None | none | NONE) ;;
  0)
    exit 0
    ;;
  *)
    echo "Please enter valid input"
    exit 1
    ;;
  esac
  count=$((count - 1))
  echo $count
done

cupsfilter "$output_file".txt >"$output_file".pdf
list_files_directories

## SEND EMAIL

read -rp "Enter sender email address :" sender
read -rp "Enter receiver email address :" receiver
read -rp "Enter gmail application password :" gmailapp_password
read -rp "Enter email subject  :" subject

send_email "$sender" $receiver" "$gmailapp_password" "$subject" "$output_file.pdf
list_files_directories
remove_file "$output_file".*

:'
  if [[ $choice == "cpu" ]]
   then 
    cpu_stats
   elif [[$choice == "mem"]]
   then 
      mem_stats
      else echo "Please enter a valid input"
      exit 1

fi '
