#!/usr/bin/env bash

echo "===== NETWORK LOG REPORT ====="
echo "Generated at: $(date)"
echo

# 1. Active connections
echo "---- Active Connections ----"
ss -tunap 2>/dev/null | head -n 10
echo

# 2. Listening ports
echo "---- Listening Ports ----"
ss -tuln
echo

# 3. Recent SSH login attempts
echo "---- Recent SSH Attempts ----"
if [ -f /var/log/auth.log ]; then
  grep "sshd" /var/log/auth.log | tail -n 10
else
  echo "Auth log not found or permission denied"
fi
echo

# 4. Network interface stats
echo "---- Network Interfaces ----"
ip -brief address
echo

# 5. Bandwidth usage snapshot
echo "---- Network Traffic (summary) ----"
cat /proc/net/dev | awk 'NR>2 {print $1, "RX:", $2, "TX:", $10}'
echo

echo "===== END OF REPORT ====="
