# Add loopback
iptables -A INPUT -i lo -j ACCEPT

# Add specific port inputs
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Drop all other sources of traffic
iptables -A INPUT -j DROP

# Save rules
/sbin/iptables-save

