# Desafio - Virada da Qualidade

Projeto de automação de testes desenvolvido para o desafio Virada da Qualidade.\
Cada Projeto possui sua própria documentação específica em sua respectiva pasta.

## Execução local
O tutorial de execução local está nos READMEs de cada projeto.
## Execução docker-compose
1. Acesso: acessar a raiz do repositório usando um terminal
2. Execução:
- Execução dos testes usando docker-compose: executar o comando `docker-compose up`
3. Reports:
- Reports estarão disponíveis em pastas na raiz do repositório:
- frontend: `/reports-frontend`
- backend: `/reports-backend`
## Execução Jenkins
Jenkinsfile configurado para execução em CI e geração de métricas através de histórico de reports.\
Necessidade de plugins instalados:
- Docker plugin
- Docker pipeline
- Cucumber reports

A execução do Jenkins foi configurada para rodar através dos Dockerfiles dos projetos.
