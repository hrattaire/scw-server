# Add loopback
iptables -A INPUT -i lo -j ACCEPT

# Add specific port inputs
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Open server config
iptables -A INPUT -i ens2 -m state --state NEW -p udp --dport 1194 -j ACCEPT
iptables -A INPUT -i tuntcp443 -j ACCEPT
iptables -A INPUT -i tunudp1194 -j ACCEPT

iptables -A FORWARD -i tuntcp443 -j ACCEPT
iptables -A FORWARD -i tunudp1194 -j ACCEPT

iptables -A FORWARD -i tunudp1194 -o ens2 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i tuntcp443 -o ens2 -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A FORWARD -i ens2 -o  tunudp1194 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i ens2 -o tuntcp443  -m state --state RELATED,ESTABLISHED -j ACCEPT

# Drop all other sources of traffic
iptables -A INPUT -j DROP

# Save rules
/sbin/iptables-save

