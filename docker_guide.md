
# Docker: Dockerfile, Docker Compose e Comandos Principais

## Dockerfile
O **Dockerfile** é um arquivo de texto com uma série de instruções que descrevem como montar uma imagem Docker. Ele especifica as etapas para construir uma imagem, como o sistema operacional base, pacotes necessários, dependências, e configurações. Cada instrução no Dockerfile cria uma camada na imagem, o que torna a construção eficiente, pois as camadas que não mudam são reutilizadas.

**Exemplo de uso do Dockerfile:**
```dockerfile
# Escolhe a imagem base
FROM node:14

# Define o diretório de trabalho
WORKDIR /app

# Copia o arquivo package.json e instala dependências
COPY package.json /app
RUN npm install

# Copia o restante do código
COPY . /app

# Expõe a porta 3000
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["npm", "start"]
```

## Docker Compose
O **Docker Compose** é uma ferramenta que permite definir e gerenciar aplicações multi-containers no Docker. Ele usa um arquivo `docker-compose.yml` para descrever a infraestrutura da aplicação, como diferentes serviços (containers), redes e volumes. É útil quando você precisa gerenciar múltiplos containers (como uma aplicação web, um banco de dados, e uma API rodando juntos).

**Exemplo de uso do Docker Compose (docker-compose.yml):**
```yaml
version: '3'
services:
  web:
    build: .
    ports:
      - "3000:3000"
    volumes:
      - .:/app
    depends_on:
      - db
  db:
    image: postgres
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
    ports:
      - "5432:5432"
```

## Diferenças principais:
- **Dockerfile**: Especifica como construir uma **única** imagem de container.
- **Docker Compose**: Gerencia e orquestra **múltiplos** containers, como se fossem serviços de uma aplicação completa.

## Principais Comandos Docker:

- **docker build**: Constrói uma imagem a partir de um Dockerfile.
  ```bash
  docker build -t nome_da_imagem .
  ```

- **docker run**: Cria e roda um container a partir de uma imagem.
  ```bash
  docker run -p 3000:3000 nome_da_imagem
  ```

- **docker ps**: Lista os containers em execução.
  ```bash
  docker ps
  ```

- **docker stop**: Para um container em execução.
  ```bash
  docker stop nome_do_container
  ```

- **docker-compose up**: Inicia todos os serviços definidos no `docker-compose.yml`. A flag -d significa detach, ela faz os containers rodar em background sem tomar conta do terminal com a saida de informação dos containers.
A flag -f é usada quando quando é necessario indicar o diretorio do arquivo compose.yaml, isso quando ele não está na raiz do projeto.
A flag --force-recreate no comando docker-compose up força a recriação dos containers, mesmo que não haja mudanças nas definições dos serviços ou nas imagens. Isso é útil quando você deseja garantir que todos os containers sejam recriados do zero, por exemplo, para aplicar novas configurações ou resolver problemas.
  ```bash
  docker-compose up -d
  ```

- **docker-compose down**: Este comando é usado para parar e remover containers, redes, volumes e imagens criados pelo comando `docker-compose up`. É útil quando você deseja limpar todos os recursos associados a um conjunto de serviços definidos em um arquivo docker-compose.yml.
  ```bash
  docker-compose down
  ```

- **docker images**: Este comando lista todas as imagens Docker locais no seu sistema. As imagens são os templates a partir dos quais os containers são criados. A saída deste comando inclui informações como o repositório, tag, ID da imagem, data de criação e tamanho da imagem.
  ```bash
  docker images
  ```

- **docker rmi**: O comando docker rmi é usado para remover uma imagem Docker específica do seu sistema. Você precisa fornecer o nome ou ID da imagem que deseja remover. Este comando é útil para liberar espaço em disco removendo imagens que não são mais necessárias.
  ```bash
  docker rmi nome_da_imagem
  ```

- **docker logs**: Este comando exibe os logs de um container específico. Os logs podem incluir informações sobre a execução do container, mensagens de erro e outras saídas geradas pelo aplicativo em execução dentro do container. Para usar este comando, você precisa fornecer o nome ou ID do container.
  ```bash
  docker logs nome_do_container
  ```

  - **docker system prune**: comando docker system prune é usado para limpar o sistema Docker removendo todos os containers parados, redes não utilizadas, imagens não referenciadas e caches de build. A opção --volumes adicionalmente remove todos os volumes não utilizados. Este comando é útil para liberar espaço em disco e manter o ambiente Docker limpo.
  ```bash
   docker system prune --volumes
  ```

 