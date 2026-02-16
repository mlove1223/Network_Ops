#!/bin/bash

HOSTS=(
10.109.32.1
10.109.12.1
10.101.32.1
10.101.49.1
10.103.49.1
10.15.1.212
10.6.11.200
10.174.3.197
10.174.3.164
10.174.3.107
10.174.2.115
)

echo "---- Ping Test Started ----"
echo

for HOST in "${HOSTS[@]}"
do
    ping -c 1 -W 1000 "$HOST" > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "✅ $HOST — SUCCESS"
    else
        echo "❌ $HOST — FAILED"
    fi
done

echo
echo "---- Ping Test Complete ----"
echo
read -p "Press Enter to close..."
