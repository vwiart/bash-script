#!/bin/bash
#flush iptables
/sbin/iptables -F

/sbin/iptables -A INPUT -i eth0 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

#dns
/sbin/iptables -A INPUT -p udp --sport 53 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A INPUT -p udp --dport 53 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --sport 53 -j ACCEPT
/sbin/iptables -A INPUT -p tcp --dport 53 -j ACCEPT

#web
/sbin/iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
/sbin/iptables -A INPUT -i eth0 -p tcp --dport 443 -j ACCEPT

#ssh
#on drop les connections SSH au bout de 5 tentatives infructueuse
iptables -I INPUT -p tcp --dport 22 -i eth0 -m conntrack --ctstate NEW -m recent --set
iptables -I INPUT -p tcp --dport 22 -i eth0 -m conntrack --ctstate NEW -m recent --update --seconds 60 --hitcount 6 -j DROP

/sbin/iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT

#ping
/sbin/iptables -A INPUT -i eth0 -p icmp -j ACCEPT

/sbin/iptables -A INPUT -i eth0 -j REJECT
