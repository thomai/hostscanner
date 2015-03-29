#!/bin/sh

IP_RANGES_FILE=$1

echo
echo Starting ZMap with port 25
echo ==========================
zmap -p 25 -w $IP_RANGES_FILE -b blacklist -o ../../results/zmap_output_25 &

echo
echo Starting ZMap with port 465
echo ===========================
zmap -p 465 -w $IP_RANGES_FILE -b blacklist -o ../../results/zmap_output_465 &

echo
echo Starting ZMap with port 587
echo ===========================
zmap -p 587 -w $IP_RANGES_FILE -b blacklist -o ../../results/zmap_output_587 &

echo Wait for ZMap scans...
wait

echo
echo DNS reverse lookup all hosts
echo ============================
python format_and_prepare_results.py ../../results/ ../../results/hosts_to_scan

echo
echo Finished
