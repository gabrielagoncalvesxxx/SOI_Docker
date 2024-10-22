Dockerfile Sistemas Operacionais I
Prof. Leandro Colevati FATEC ZL
Ferramenta para compartilhamento de pequenos códigos:
https://pastebin.com

Carregar os arquivos das respostas em Drives públicos ou Pastebin para responder com os links.
Exercícios:
Parte 1 (Operações no S.O. Hospedeiro):
1. Criar uma pasta no host /usr/src/appjava: mkdir -p /usr/src/appjava
2. Criar um arquivo, na pasta /usr/src/appjava, na linguagem JAVA (Eu.java), cuja Main chama um
while(true) que, a cada 5 Minutos (300.000 milissegundos) exiba seu nome no console. A chamada
deve estar em um while (true) para não encerrar (Não usar package nesse arquivo). O nome da
classe deve ser o mesmo nome do arquivo (public class Eu).
3. Criar uma pasta no host /usr/src/projjava: mkdir -p /usr/src/projjava
4. Ativar a pasta appjava: cd /usr/src/appjava
Parte 2 (Dockerfile e criação de contêiner Docker):
Montar um dockerfile de testes de aplicação Java, considerando as características:
1) A imagem base deve ser o OpenJDK com a versão do JAVA que você desenvolveu seus projetos até o
momento (pode ser 11, 17, 21, ...) [openjdk:21-jdk, pro exemplo]
2) A pasta /usr/src/appjava deve ser criada
3) A pasta /usr/src/projjava deve ser criada
4) A pasta /usr/src e suas subpastas devem receber acesso total (Comando chmod -R 777)
5) O arquivo Eu.java deve estar na pasta do Dockerfile
6) Copiar todos os arquivos da pasta do Dockerfile para /usr/src/appjava
7) Excluir de /usr/src/appjava o arquivo Dockerfile
8) Rodar o comando de compilação de Eu.java: javac -cp -d /usr/src/appjava/Eu.java
9) O diretório de trabalho deve ser /usr/src/projjava
10) A pasta /usr/src/projjava deve ser mapeada para compartilhamento
11) Todo contêiner gerado por essa imagem deve rodar o comando java -cp /usr/src/appjava/ Eu
• São 4 cláusulas (java, -cp, /usr/src/appjava, Eu)
Criar a imagem a partir do Dockerfile com o nome imgjavaaula
Criar um contêiner de nome javaaula com o volume /usr/src/projjava (Se essa pasta não existir, deve
ser criada) mapeada na pasta /usr/src/projjava do contêiner
Rodar o comando docker ps para verificar se o contêiner foi criado
Rodar o comando docker logs javaaula e veificar se a saída de Eu.java aparece no console (Ou
eventuais erros de criação)

Dockerfile Sistemas Operacionais I
Prof. Leandro Colevati FATEC ZL
Parte 3 (Validação de contêiner):
Criar na pasta /usr/src/projjava um arquivo Soma.java com a classe:
public class Soma {
public static void main(String[] args) {
int a = Integer.parseInt(args[0]);
int b = Integer.parseInt(args[1]);
int c = a + b;
System.out.println(c);
}
}
• Note que se trata de uma classe que espera 2 parâmetros vindos do console
Rodar um comando docker exec que compila com javac Soma.java (Conforme apresentado no item 8
da parte 2)
Rodar um comando docker exec que executa com java a classe Soma (Conforme apresentado no item
11 da parte 2)
Testar com Soma 10 20, devendo aparecer 30 no console

Responder com o Dockerfile, o script de criação do contêiner, o script de compilação e de execução
da classe Soma
