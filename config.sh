IP="/sbin/iptables-nft"
IP6="/sbin/ip6tables-nft"
IPS="/sbin/ipset"
NFT="/sbin/nft"
SC="/sbin/sysctl"

sysctl_conf="/etc/sysctl.conf"
backup_dir="/etc/sysctl_backups"
num_backups=$(find "$backup_dir" -maxdepth 1 -type f | wc -l)
max_backups=5
timestamp=$(date "+%Y%m%d%H%M%S")
backup_file="$backup_dir/sysctl.conf_$timestamp"
SSH="22"

# All ports of running webservers.
HTTP="80,443,8080"

# Connection limit
CL="50"
# Connection limit action
CLA="DROP"
# IP Block action
IBA="DROP"
# SYN PPS limit
SPL="5/s"
# SYN-ACK PPS limit
SAPL="5/s"
# RST PPS limit
RPL="2/s"
# UDP PPS limit
UPL="3000/s"
# ICMP PPS limit
IPL="2/s"
# Hashtable size (buckets)
HTS="65536"
# Hashtable max entries in the hash
HTM="65536"
# Hashtable expire (ms)
HTE="300000"
# MSS limit
MSS="536:65535"
# Packet state filter
ST="INVALID"
# Limited UDP source ports (against amplification
LUSP="19,53,123,111,123,137,389,1900,3702,5353"
# Invalid TCP Flag packet action
ITFPA="DROP"
# Outgoing port-unreach limit
OPL="5/m"
# Outgoing TCP RST limit
OTRL="10/s"
# Colors
BGray="\033[1;37m"
BRed="\033[1;31m"