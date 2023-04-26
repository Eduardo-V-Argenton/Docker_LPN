Docker usado durante o trabalho de Engenharia de Software 2

# Configurações iniciais
### Uma vez com o docker compose instalado é necessário algumas alterações no arquivo [docker-compose.yml](https://github.com/Eduardo-V-Argenton/Docker_LPN/blob/main/docker-compose.yml).
Todas são nos enviroment do container python:
-  DJANGO_SECRET_KEY: Gere um secret-key para a aplicação
- TWITCH_CLIENT_ID: ID Twitch dev
- TWITCH_CLIENT_SECRET: Secret-Key twitch dev

para obtenção do ID e Secret Key twitch siga a [documentação da twitch](https://dev.twitch.tv/docs/authentication/) e a documentação da [API do IGDB](https://api-docs.igdb.com/#account-creation)

Uma vez essas configurações feitas é apenas subir os containers.
Recomendo o comando:
```
docker-compose up -d
```
Para ver logs apenas remova o -d

# Possiveis Erros
## 502 Bad Gateway ao subir
Esse erro pode ocorrer pelo fato de que o container python ainda não foi inicializado, apenas aguarde.

## Mesmo após mais de 30s após subir continua o erro 502 Bad Gateway
Nesse caso reinicie os containers, caso persisistir veja os logs para entender oq está impedindo a inicilização do mesmo

## Não há usuário admin
Caso esse erro ocorra entre no container python e execute o seguinte comando:
```
python manage.py createsuperuser --noinput --username=$DJANGO_SUPERUSER_USERNAME --email=$DJANGO_SUPERUSER_EMAIL --name=$DJANGO_SUPERUSER_NAME
```
