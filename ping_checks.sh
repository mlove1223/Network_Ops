#!/bin/bash

HOSTS=(
10.x.x.x
10.x.x.x
10.x.x.x
10.x.x.x
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
