#!/usr/bin/python3
# -*- coding: utf-8 -*-

# Cacluleur de masque à partire du nombres de machines
# Écrit par RUFFENACH Timothée le 3/07/2022

nbMachine = int(input("Veuillez entrer le nombre de machine : "))

x=0
masque=0
while masque < nbMachine:
    masque=(2**x)-2
    x=x+1

print ("Le maximum de machine est :", (2**(x-1))-2)
print ("Broadcast probable est : ", (2**(x-1))-1 % 255) 
print("Le masque réseau est :", 32-x+1)

masque = 32-x+1

masqueBinaire =""
# conversion en binaire
i=0;
while i < masque:
    masqueBinaire += "1"
    i += 1

i=0;
while i < x-1:
    masqueBinaire += "0"
    i += 1

print("Masque en Binaire :",masqueBinaire)

# coupe en morceau de 8
result = []

for i in range(0, len(masqueBinaire), 8):
    result.append(masqueBinaire[i : i + 8])


print("Masque en décimal : ", end='')

for i in range(4):
    print(str(int(result[i],2)),end= '')
    if i < 3 :
        print(".",end='')

print()