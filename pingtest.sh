#!/bin/bash

# List of IP addresses to ping
IP_ADDRESSES=(
    "IP"
    "IP"
)

# Duration to ping each IP in seconds
PING_DURATION_SECONDS=5

echo "Starting continuous ping test for ${PING_DURATION_SECONDS} seconds per IP..."
echo "---"

# Loop through each IP address and ping it for the specified duration
for IP in "${IP_ADDRESSES[@]}"; do
    echo "Pinging ${IP} for ${PING_DURATION_SECONDS} seconds..."
    # -c $(($PING_DURATION_SECONDS * 2)) is an approximation. Ping sends 1 packet/sec.
    # We double it to ensure it runs for at least the duration, accounting for network delays.
    # -i 0.5 sets the interval to 0.5 seconds to send more packets within the duration.
    ping -c $(($PING_DURATION_SECONDS * 2)) -i 0.5 "${IP}"

    echo "---"
done

echo "Ping test completed."
