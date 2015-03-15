#!/bin/sh

IP_RANGE=$1

echo
echo Starting ZMap with port 25
echo =====================
zmap -p 25 $IP_RANGE -b blacklist -o results/zmap_output_25

echo
echo Starting ZMap with port 465
echo ======================
zmap -p 465 $IP_RANGE -b blacklist -o results/zmap_output_465

echo
echo Starting ZMap with port 587
echo ======================
zmap -p 587 $IP_RANGE -b blacklist -o results/zmap_output_587

echo
echo DNS reverse lookup all hosts
echo ============================
python reverse_lookup_scanner.py

echo
echo Finished
