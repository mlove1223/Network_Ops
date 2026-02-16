#!/bin/bash

SITES=(
https://kbase.sram.com/kb/index.php?CategoryID=27
https://swiki.sram.com/
http://psp.sram.com/
http://serilook.sram.com/
https://cqf.sram.com/cqfs.php
https://sram-prod.mdm.stibosystems.com/
https://sram-preprod.mdm.stibosystems.com/
https://sram-dev.mdm.stibosystems.com/
)

echo "---- HTTPS Check Started ----"
echo

for SITE in "${SITES[@]}"
do
    HTTP_CODE=$(curl -Is --connect-timeout 5 "$SITE" | head -n 1 | awk '{print $2}')

    if [[ "$HTTP_CODE" =~ ^2|3 ]]; then
        echo "✅ $SITE — SUCCESS (HTTP $HTTP_CODE)"
    else
        echo "❌ $SITE — FAILED (HTTP $HTTP_CODE)"
    fi
done

echo
echo "---- HTTPS Check Complete ----"
echo
read -p "Press Enter to close..."
