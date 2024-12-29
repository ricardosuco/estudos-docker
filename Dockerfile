# O From diz qual a imagem existente da aplicacao que queremos usar, nesse caso a versão do node
FROM node:14.16.1-alpine3.10 
 
# Define o diretorio de trabalho
WORKDIR /usr/app

# Copia o package.json e o package-lock.json para o diretorio de trabalho
COPY package*.json ./

# Roda o comando para instalar as dependencias do projeto
RUN npm install

# Copia o resto dos arquivos para o diretorio de trabalho
COPY . .

# Expoe a porta 3000 para o mundo
EXPOSE 3000

# Roda os comandos necessários para executar a aplicação
CMD ["npm", "start"]