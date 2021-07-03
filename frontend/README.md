# Automação frontend

Projeto de automação frontend, estruturado para multi aplicações, utilizando as seguintes tecnologias:
- `ruby` - linguagem de implementação
- `site_prism` - gem para implementação de page objects
- `capybara` - gem dsl selenium com camada de abstração extra
- `selenium-webdriver` - gem para comunicação com webdriver
- `cucumber` - gem para implementação de Gherkin
- `faker` - gem para geração de dados
- `rspec` - gem para validações padronizadas
- `pry` - gem para debug em tempo de execução
- `parallel_tests` - gem para execução paralelizada
- `report_builder` - gem para reports customizados
- `docker` - virtualização
- `jenkins` - CI

## Overview
O código utiliza Design Patterns e estruturações avançadas, visando manutenção e reaproveitamento em grande escala.\
- Uso de Gherkin (features/steps)
- Uso de Page Objects Model
- Massas de dados centralizadas com estrutura de controle (Factory)
- Configuração multi ambiente (massas de dados dinâmicos)
- Configuração multi pages (spec_helper - possibilidade de adição de outras camadas reutilizando os mesmos steps)
- Execução paralelizada
- Validações profundas (feature validada ao todo)
- Testes e2e de verdade -> simulando usuário (acessos através de clicks, sem hooks de facilitação)
- Validação de fluxos felizes e tristes
- Execução em headless

## Requisitos
- Ruby >= 2.5.3 ou Docker
- Bundler atualizado (caso optar por Ruby, executar o comando `gem install bundler`)
- Navegador Google Chrome instalado
- [(chromedriver]('https://chromedriver.chromium.org/downloads') compatível com a versão do chrome instalada\
-- Baixar e extrair em uma pasta que esteja no path (ex: pasta bin do ruby)

## Execução
### Local
1. Acesso: acessar a raiz do projeto usando um terminal
2. Instalação de dependências: executar o comando `bundle install`
3. Execução:
- Execução dos testes serial: executar o comando `bundle exec cucumber`
- Execução dos testes paralela: executar o comando `bundle exec parallel_cucumber features/ -n 8 -o "-p parallel"`
- Execução de uma suite específica: executar o comando `bundle exec cucumber -t @tag_desejada` (cenários e funcionalidades contém tags de execução)
- Execução em headless: executar o comando `bundle exec cucumber -p default -p headless` (se for em paralelo: `bundle exec parallel_cucumber features/ -n 8 -o "-p parallel -p headless"`)

### Docker
- Configurado para executar através do docker-compose, para executar volte a raiz do repositório e siga as instruções do README principal.

## Cenários validados
Login
- Login com dados válidos
- Login com email em branco
- Login com senha em branco
- Login com email inválido
- Login com senha curta
- Login com dados inválidos

Cadastro de Usuário
- Cadastro de usuário com dados válidos
- Cadastro de usuário com nome em branco
- Cadastro de usuário com email em branco
- Cadastro de usuário com senha em branco
- Cadastro de usuário com confirmação de senha em branco
- Cadastro de usuário com email inválido
- Cadastro de usuário com senha curta
- Cadastro de usuário com senhas diferentes

Criação de perfil
- Criação de perfil com dados válidos
- Criação de perfil com conhecimentos em branco
- Criação de perfil com website inválido
- Criação de perfil com twitter inválido
- Criação de perfil com facebook inválido
- Criação de perfil com youtube inválido
- Criação de perfil com linkedin inválido
- Criação de perfil com instagram inválido
- Criação de perfil com medium inválido

## Falhas
Foi encontrado um problema nos seguintes fluxos:
- Criar perfil com status em branco\
-- Não é exibida a mensagem 'Status é obrigatório'
- Cadastro de usuário com nome em branco\
-- Mostra mensagem 'Email é obrigatório' ao invés de 'Nome é obrigatório'

## Métricas
Reports HTML/JSON foram configurados e serão gerados na pasta reports (quando executado localmente).\
Usando o Jenkins, com o plugin cucumber-reports instalado, os reports serão gerados na aba reports, com métricas e acompanhamento da qualidade geral do sistema.

## Extras
Além da configuração para rodar em Continuous Integration com virtualização (Jenkins+Docker), foi adicionada uma configuração para execução dos testes em paralelo (para quando o projeto cresce e existem muitos cenários), assim mantendo o tempo de execução regressiva baixo.

