#!/bin/bash


	echo "Digite a interface de rede a ser escaneada:"
		read INT
FIL=`ifconfig $INT | grep 'inet' | cut -c 1-30| head -n 1 | tr -d [a-zA-Z," "]`
FILL=`ifconfig $INT | grep 'netmask' | cut -c 30-57 | head -n 1 | tr -d [a-zA-Z," "]`
MASC=`grep $FILL masc.txt | cut -d : -f2`
IPS=`fping -g $FIL$MASC -a  2> /dev/null`
	echo "Maquinas disponíveis na rede:"
	echo "$IPS"
	echo "Digite o IP do alvo:"
		read ALVO
SCANMAC=`nmap -sT --osscan-guess $ALVO | grep "MAC" | cut -d : -f2,3,4,5,6,7 | cut -d "(" -f1 | tr -d [" "]`
SCANFAB=`nmap -sT --osscan-guess $ALVO | grep "MAC" | cut -d "(" -f2 | cut -d "(" -f2 | tr -d [')']`
	echo "O host $ALVO com o MAC $SCANMAC foi produzido por $SCANFAB."























#	if [ != ];then
#		echo -e "\aFabricante desconhecido!"
#	else
#		echo "O IP $IPES com o MAC $MAC foi fabricado pela $FAB."
# 	fi
