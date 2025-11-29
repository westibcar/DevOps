#!/bin/bash

# --- Função do menu ---
informacao_sistema() {
    echo "=== Informação do Sistema =="
    uname -a
    echo
    read -p "Pressione ENTER para voltar ao menu..."
} 

listar_arquivo() {
    echo "=== Arquivo no diretorio atual =="
    ls -lh
    echo
    read -p "Pressione ENTER para voltar ao menu..."
} 

monitorar_processos() {
    echo "=== Top 10 Processos por Uso de CPU =="
    ps axu --sort==-%cpu | head
    echo
    read -p "Pressione ENTER para voltar ao menu..."
} 

buscar_arquivo() {
    read -p "Digite o nome do arquivo que deseja buscar: " nome
    find / -name "$nome" 2>/dev/null | head
    echo
    read -p "Pressione ENTER para voltar ao menu..."
}

uso_disco() {
    echo "=== Uso do Disco ==="
    df -h
    echo
    read -p "Pressione ENTER para voltar ao menu..."
}

sair() {
    echo "Saindo... até logo!"
    exit 0
}

while true; do
   clear
   echo "=== MENU PRINCIPAL ==="
   echo "1) Informações do Sistema"
   echo "2) Listar arquivos da pasta atual"
   echo "3) Ver processos mais pesados"
   echo "4) Buscar arquivos no sistema"
   echo "5) Ver uso do disco"
   echo "6) Sair"
   echo
   read -p "Escolha uma opção: " opcao
   
   case $opcao in 
      1) informacao_sistema;;
      2) listar_arquivo;;
      3) monitorar_processos;;
      4) buscar_arquivo;;
      5) uso_disco;;
      6) sair;;
      *) echo "Opção invalida"; sleep 1;;
    esac
done  

