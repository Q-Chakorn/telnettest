#!/bin/bash

# List of IP addresses and ports to test
TARGETS=(
    "IP:PORT"
    "IP:PORT"
)

# Timeout for each connection attempt in seconds
TIMEOUT_SECONDS=10

echo "Starting port connectivity test with a timeout of ${TIMEOUT_SECONDS} seconds per IP:Port..."
echo "---"

# Loop through each IP:Port target
for TARGET in "${TARGETS[@]}"; do
    IP=$(echo "$TARGET" | cut -d':' -f1)
    PORT=$(echo "$TARGET" | cut -d':' -f2)

    echo "Testing connection to ${IP}:${PORT}..."

    # Use nc (netcat) for port checking with a timeout
    # -z: Zero-I/O mode (don't send any data, just check for open port)
    # -v: Verbose output
    # -w ${TIMEOUT_SECONDS}: Timeout for the connection
    if nc -zv -w "${TIMEOUT_SECONDS}" "${IP}" "${PORT}" &> /dev/null; then
        echo "  ${IP}:${PORT} is REACHABLE"
    else
        echo "  ${IP}:${PORT} is UNREACHABLE or TIMED OUT"
    fi
    echo "---"
done

echo "Port connectivity test completed."
