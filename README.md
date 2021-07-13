# Desafio - Virada da Qualidade
![Version](https://img.shields.io/badge/version-1.0-blue.svg?cacheSeconds=2592000)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/paulowsky/desafio-virada-qualidade/graphs/commit-activity)

Projeto de automação de testes desenvolvido para o desafio Virada da Qualidade da [Iterasys](https://iterasys.com.br/).\
Cada Projeto possui sua própria documentação específica:
- [Frontend](https://github.com/paulowsky/desafio-virada-qualidade/tree/main/frontend#readme)
- [Backend](https://github.com/paulowsky/desafio-virada-qualidade/tree/main/backend#readme)

## 💻 Execução Local
O tutorial de execução local está nos READMEs de cada projeto.
## 🐳 Execução Docker Compose
#### Acesso
Acessar a raiz do repositório usando um terminal
```sh
cd desafio-virada-qualidade
```
#### Execução
- Execução dos testes usando docker-compose:
```sh
docker-compose up
```
#### Reports
- Reports estarão disponíveis em pastas na raiz do repositório:
- frontend: `/reports-frontend`
- backend: `/reports-backend`
## 🤵 Execução Jenkins
Jenkinsfile configurado para execução em CI e geração de métricas através de histórico de reports.\
Necessidade de plugins instalados:
- Docker plugin
- Docker pipeline
- Cucumber reports

A execução do Jenkins foi configurada para rodar através dos Dockerfiles dos projetos. O [Jenkinsfile](https://github.com/paulowsky/desafio-virada-qualidade/blob/main/Jenkinsfile) contém a estrutura do pipeline.

## 🤝 Contribuições

Contribuições, issues e novas funcionalidades são bem-vindas!\
#PRsWelcome

Sinta-se à vontade para verificar a [página de issues](https://github.com/paulowsky/desafio-virada-qualidade/issues). 

## ⭐️ Mostre seu apoio

Dê uma ⭐️ se o projeto te ajudou de alguma forma! :)

## 📝 Licença

Copyright © 2021 [Paulo Cesar Martins Citron](https://github.com/paulowsky).

Este projeto possui a licença [MIT](https://github.com/paulowsky/desafio-virada-qualidade/blob/main/LICENSE).

## Autor
| [<img src="https://github.com/paulowsky.png?size=80" width=80><br><sub>@paulowsky</sub>](https://github.com/paulowsky) |
| :---: |
