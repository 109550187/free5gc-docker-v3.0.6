#!/bin/bash

#Configuração da rede pare teste do ping
ip link set lo up 
ip addr add  60.60.0.101 dev lo   
ip link set lo up


#Configuração de regras de reteamento
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1400


echo "Ending run script !!!"