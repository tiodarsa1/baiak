#!/bin/bash 


sudo iptables -t mangle -A PREROUTING -m conntrack --ctstate INVALID -j DROP
sudo iptables -t mangle -A PREROUTING -p tcp ! --syn -m conntrack --ctstate NEW -j DROP
sudo iptables -t mangle -A PREROUTING -p tcp -m conntrack --ctstate NEW -m tcpmss ! --mss 536:65535 -j DROP
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,SYN FIN,SYN -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,RST FIN,RST -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,ACK FIN -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,URG URG -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,FIN FIN -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,PSH PSH -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL ALL -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL NONE -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,PSH,URG -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL SYN,FIN,PSH,URG -j DROP 
sudo iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
sudo iptables -t mangle -A PREROUTING -s 224.0.0.0/3 -j DROP 
sudo iptables -t mangle -A PREROUTING -s 169.254.0.0/16 -j DROP 
sudo iptables -t mangle -A PREROUTING -s 172.16.0.0/12 -j DROP 
sudo iptables -t mangle -A PREROUTING -s 192.0.2.0/24 -j DROP 
sudo iptables -t mangle -A PREROUTING -s 192.168.0.0/16 -j DROP 
sudo iptables -t mangle -A PREROUTING -s 10.0.0.0/8 -j DROP 
sudo iptables -t mangle -A PREROUTING -s 0.0.0.0/8 -j DROP 
sudo iptables -t mangle -A PREROUTING -s 240.0.0.0/5 -j DROP 
sudo iptables -t mangle -A PREROUTING -s 127.0.0.0/8 ! -i lo -j DROP
sudo iptables -t mangle -A PREROUTING -p icmp -j DROP
sudo iptables -A INPUT -p tcp -m connlimit --connlimit-above 80 -j REJECT --reject-with tcp-reset
sudo iptables -A INPUT -p tcp -m conntrack --ctstate NEW -m limit --limit 60/s --limit-burst 20 -j ACCEPT 
sudo iptables -A INPUT -p tcp -m conntrack --ctstate NEW -j DROP
sudo iptables -t mangle -A PREROUTING -f -j DROP
sudo /sbin/iptables -t mangle -A PREROUTING -m conntrack --ctstate INVALID -j DROP  
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp ! --syn -m conntrack --ctstate NEW -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp -m conntrack --ctstate NEW -m tcpmss ! --mss 536:65535 -j DROP  
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,SYN FIN,SYN -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,RST FIN,RST -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags FIN,ACK FIN -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,URG URG -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,FIN FIN -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags ACK,PSH PSH -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL ALL -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL NONE -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL FIN,PSH,URG -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL SYN,FIN,PSH,URG -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP  
sudo /sbin/iptables -t mangle -A PREROUTING -s 224.0.0.0/3 -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -s 169.254.0.0/16 -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -s 172.16.0.0/12 -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -s 192.0.2.0/24 -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -s 192.168.0.0/16 -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -s 10.0.0.0/8 -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -s 0.0.0.0/8 -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -s 240.0.0.0/5 -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -s 127.0.0.0/8 ! -i lo -j DROP 
sudo /sbin/iptables -t mangle -A PREROUTING -f -j DROP  
sudo /sbin/iptables -A INPUT -p tcp -m connlimit --connlimit-above 111 -j REJECT --reject-with tcp-reset  
sudo /sbin/iptables -A INPUT -p tcp --tcp-flags RST RST -m limit --limit 2/s --limit-burst 2 -j ACCEPT 
sudo /sbin/iptables -A INPUT -p tcp --tcp-flags RST RST -j DROP  
sudo /sbin/iptables -A INPUT -p tcp -m conntrack --ctstate NEW -m limit --limit 60/s --limit-burst 20 -j ACCEPT 
sudo /sbin/iptables -A INPUT -p tcp -m conntrack --ctstate NEW -j DROP  
sudo /sbin/iptables -N port-scanning 
sudo /sbin/iptables -A port-scanning -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s --limit-burst 2 -j RETURN 
sudo /sbin/iptables -A port-scanning -j DROP
sudo /sbin/iptables -A INPUT -p tcp --dport ssh -m conntrack --ctstate NEW -m recent --set 
sudo /sbin/iptables -A INPUT -p tcp --dport ssh -m conntrack --ctstate NEW -m recent --update --seconds 60 --hitcount 10 -j DROP  