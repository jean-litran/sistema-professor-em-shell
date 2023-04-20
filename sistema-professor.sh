#!bin/bash
echo " Bem vindo ao sistema professor em shell script
 _____                 _             
/  __ \               | |            
| /  \/ ___  _ __ ___| |_ ___  _ __ 
| |    / _ \| '__/ __| __/ _ \| '__|
| \__/\ (_) | |  \__ \ || (_) | |   
 \____/\___/|_|  |___/\__\___/|_|   
"
# função para inserir as notas de um aluno
inserir_notas_aluno() {
    read -p "Digite o nome do aluno: " nome
    read -p "Digite a nota 1: " nota1
    read -p "Digite a nota 2: " nota2
    media=$(echo "scale=2; ($nota1 + $nota2) / 2" | bc)
    echo "A média do aluno $nome é $media"
    return $media
}
# Função para calcular a média da turma

# Função para calcular a média da turma
calcular_media_turma() {
    turma=("$@")
    soma=0
    for nota in "${turma[@]}"
    do
        soma=$(echo "$soma + $nota" | bc)
    done
    media=$(echo "scale=2; $soma / ${#turma[@]}" | bc)
    echo "$media"
}
#Lista para armazenar as notas da turma A
turma_a=()
# Lista para armazenar as notas da turma B
turma_b=()
# Loop para inserir e armazenar as notas dos alunos
while true 
do 
 echo "1. Inserir nota da turma A"
    echo "2. Inserir nota da turma B"
    echo "3. Calcular média das turmas"
    echo "4. Sair"

    read -p "Digite uma opção: " opcao
        if [ "$opcao" -eq 1 ]
    then
        nota_a=$(inserir_notas_aluno)
        turma_a+=("$nota_a")
    elif [ "$opcao" -eq 2 ]
    then
        nota_b=$(inserir_notas_aluno)
        turma_b+=("$nota_b")
    elif [ "$opcao" -eq 3 ]
    then
        media_a=$(calcular_media_turma "${turma_a[@]}")
        media_b=$(calcular_media_turma "${turma_b[@]}")
        echo "Média da turma A: $media_a"
        echo "Média da turma B: $media_b"
    elif [ "$opcao" -eq 4 ]
    then
        break
    else
        echo "Opção inválida. Tente novamente."
    fi
done
# Função para salvar as médias da turma A e B no arquivo "medias.txt"
salvar_medias() {
    media_a=$1
    media_b=$2
    turma_a=("$3")
    turma_b=("$4")
    nome_arquivo=$5

    echo "Média da turma A: $media_a" > "$nome_arquivo.txt"
    echo "Média da turma B: $media_b" >> "$nome_arquivo.txt"
    echo "" >> "$nome_arquivo.txt"
    echo "Turma A:" >> "$nome_arquivo.txt"
    i=1
    for nota in "${turma_a[@]}"
    do
