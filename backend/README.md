# Automação backend

Projeto de automação backend, estruturado para microsserviços, utilizando as seguintes tecnologias:
- `ruby` - linguagem de implementação
- `httparty` - gem client HTTP
- `cucumber` - gem para implementação de Gherkin
- `json-schema` - gem para validação de schemas
- `faker` - gem para geração de dados
- `rspec` - gem para validações padronizadas
- `pry` - gem para debug em tempo de execução
- `parallel_tests` - gem para execução paralelizada
- `docker` - virtualização
- `jenkins` - CI

## Overview
O código utiliza Design Patterns e estruturações avançadas, visando manutenção e reaproveitamento em grande escala.
- Uso de Gherkin (features/steps)
- Uso de services e estrutura Rest (possibilidade de acoplamento de outras arquiteturas, como Soap (gem `savon`))
- Massas de dados centralizadas com estrutura de controle (Factory)
- Configuração multi-versão dos services
- Configuração multi-ambiente (massas de dados e endpoints dinâmicos)
- Execução paralelizada
- Validação de schemas
- Validações profundas (feature validada ao todo)
- Validação de fluxos felizes e tristes

## Requisitos
- Ruby >= 2.5.3 ou Docker
- Bundler atualizado (caso optar por Ruby, executar o comando `gem install bundler`)

## Execução
### Local com Ruby
1. Acesso: acessar a raiz do projeto usando um terminal
2. Instalação de dependências: executar o comando `bundle install`
3. Execução:
- Execução dos testes serial: executar o comando `bundle exec cucumber`
- Execução dos testes paralela: executar o comando `bundle exec cucumber -p parallel`
- Execução de uma suite específica: executar o comando `bundle exec cucumber -t @tag_desejada` (cenários e funcionalidades contém tags de execução)

### Docker
- Configurado para executar através do docker-compose, para executar volte a raiz do repositório e siga as instruções do README principal.

## Cenários validados
Login
- Login com dados válidos
- Login com body vazio
- Login com senha errada
- Login com senha curta
- Login com email inválido

Usuário
- Cadastro com dados válidos
- Cadastro com body vazio
- Cadastro com email já registrado
- Cadastro com senha curta
- Cadastro com email inválido

Perfil
- Criação de perfil com dados válidos (erro 503: Service Unavailable)
- Criação de perfil com body vazio
- Criação de perfil com status inválido (erro 503: Service Unavailable)
- Criação de perfil com skills inválidas (erro 503: Service Unavailable)
- Criação de perfil com website inválido (erro 503: Service Unavailable)
- Edição de perfil com dados válidos (erro 503: Service Unavailable)

## Falhas
Foi encontrado um problema na criação/edição de perfil, o qual retorna erro 503: Service Unavailable se houver qualquer campo no body da requisição.

## Métricas
Reports HTML/JSON foram configurados e serão gerados na pasta reports (quando executado localmente).\
Usando o Jenkins, com o plugin cucumber-reports instalado, os reports serão gerados na aba reports, com métricas e acompanhamento da qualidade geral do sistema.

## Extras
Além da configuração para rodar em Continuous Integration com virtualização (Jenkins+Docker), foi adicionada uma configuração para execução dos testes em paralelo (para quando o projeto cresce e existem muitos cenários), assim mantendo o tempo de execução regressiva baixo.
