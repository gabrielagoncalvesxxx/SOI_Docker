# Utiliza a imagem base do OpenJDK 21
FROM openjdk:21-jdk

# Cria as pastas necessárias
RUN mkdir -p /usr/src/appjava /usr/src/projjava

# Define permissões de acesso
RUN chmod -R 777 /usr/src

# Copia o arquivo Eu.java para a pasta appjava
COPY Eu.java /usr/src/appjava/

# Compila o arquivo Eu.java
RUN javac -d /usr/src/appjava /usr/src/appjava/Eu.java

# Define o diretório de trabalho
WORKDIR /usr/src/projjava

# Comando padrão ao iniciar o contêiner
CMD ["java", "-cp", "/usr/src/appjava", "Eu"]
