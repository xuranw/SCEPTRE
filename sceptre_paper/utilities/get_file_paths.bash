#!/bin/bash

# This script takes as an argument (i) the name of a machine ("local", "hydra", "ubergenno", "uberduo", "bridges") and (ii) the desired output ("code", "data_results", "scheduler"). It outputs the full file path of that directory on that machine in the case of "code" and "data_results", and it outputs whether the machine uses a scheduler (true/false) in the case of "scheduler".

# Define machine_name, code_dir, and data_results_dir arrays.

machine_name=(local ubergenno uberduo hydra bridges)

code_dir=(/Users/timbarry/Box/SCEPTRE/sceptre_paper /home/tbarry2/SCEPTRE/sceptre_paper /home/tbarry2/SCEPTRE/sceptre_paper hydra_code_dir /home/timbar/SCEPTRE/sceptre_paper)

data_results_dir=(/Volumes/tims_new_drive/research/sceptre_files /raid6/Tim/sceptre_offsite_dir /raid6/Tim/sceptre_offsite_dir hydra_data_dir /pylon5/ms5pidp/timbar/sceptre_files)

scheduler_bool=(false false false false true)

# find the index of the selected machine
for ((index=0; index<${#machine_name[@]}; index++))
  do
		if [ ${machine_name[$index]} == $1 ]
		then
		  machine_idx=$index
		fi
  done

# echo the correct directory
if [ $2 == "code" ]
then
  echo ${code_dir[$machine_idx]}
fi

if [ $2 == "data_results" ]
then
  echo ${data_results_dir[$machine_idx]}
fi

if [ $2 == "scheduler" ]
then
  echo ${scheduler_bool[$machine_idx]}
fi