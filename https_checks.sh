#!/bin/bash

SITES=(
site.site.com
site.site.com
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
