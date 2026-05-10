#!/bin/bash

echo " === Exemplo de IF e FOR no Bash ==="
echo

# --- IF Simples ----
read -p "Digite numero: " numero

if [ $numero -gt 10 ]; then
    echo "O numero é maior que 10!"
elif [ $numero -eq 10 ]; then
    echo "O numero é igual a 10"
else
    echo "O numero é menor que 10"
fi

echo
echo "Agora vamos testar o FOR:"
echo

# --- For Simples ---
for i in $(seq 100); do
    echo "Contando...$i"
done

echo "FIM do Script!"