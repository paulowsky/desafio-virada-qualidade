# Regulamento

### Sobre os desafio:

Nossa competição é composta por dois desafios individuais onde a pessoa inscrita pode escolher uma das opções:
1. a opção de **Planejamento de Testes** onde os candidatos farão um planejamento com fluxos principais e alternativos utilizando as melhores tecnicas/heuristicas do mercado atual e demais ações definidas na descrição detalhada do item. 
2. a opção de **Testes Automatizados** onde os candidatos farão a utilização da linguagem/framework de sua preferência com foco em melhores praticas de programação e demais ações definidas na descrição detalhada da opção. 

##### História de Usuário:

Antonella trabalha na empesa DevTechSystem. A próxima grande estratégia que a empresa gostaria de implementar é utilizar a aplicação Conexão QA para a criação de um perfil com seus cadastros e login para agilizar o processo de compartilhamento de um ou mais portfolios.

- Veja o detalhamento no item **escopo de trabalho**.


##### URL do sistema:
- Frontend: https://conexaoqa.herokuapp.com/
- Backend: https://conexaoqa.herokuapp.com/api-docs/

## Escopo de Trabalho da historia de usuário:

- Sobre o **Cadastro**

1. Todos os campos são obrigatórios
2. Email deve ter o formato de email, ex usuario@dominio.com
3. Senha deve ter no mínimo 6 caracteres
4. Confirmar senha deve ser igual ao campo senha
5. Não é permitido cadastrar usuários duplicados com mesmo email, exibir alerta de "Usuário já registrado" por 6 segundos
6. A página de cadastro deve conter um link para página de login
7. O sistema ainda não está integrado com o Gravatar 
Ao realizar um cadastro válido o usuário é automaticamente redirecionado para página de Dashboard

- Sobre o **Login**
1. Email deve ter o formato de email
2. Senha deve ter no mínimo 6 caracteres
3. Exibir o alerta "Credenciais inválidas" por 10 segundos quando o login for inválido
4. A página de login deve conter um link para página de cadastro

- Sobre o **Criar Perfil**
1. Campo status e conhecimentos são obrigatórios
2. Campos de URLs devem ter validação se o formato é válido
3. Ao salvar um perfil, o usuário é redirecionado para a página de Dashboard
4. No perfil não é necessário adicionar formação acadêmica ou experiência profissional.

## Desafio 1 - Planejamento de Testes

- Resumo: A pessoa que se candidatou ao desafio deve fazer um planejamento de testes da aplicação **Conexão QA**, sempre que possível aplicando técnicas de testes, heuristicas, entre outros.

- Criar cenários de testes com fluxos principais e alternativos (**Cenários em Gherkin** será um diferencial, aplicando melhores práticas de otimização);

- Criar mapa mental com o planejamento e depois exportar para um arquivo em formato PDF ou imagem no formato JPEG (escolha a ferramenta que quiser);

- Criar evidencias do resultado de sucesso dos testes;

- Caso ache um bug, reportar o bug;

- Os Testes de API no Postman deve cobrir os cenários de cadastro, login e criação de perfil conforme especificação. 

- Gerar evidencia dos testes de API ( print ou colection???)
Se colection subir no repositório
Se print anexar no documento

- Ao final, suba os arquivos no repositório do github, até o horário estipulado pela organização ( ver no fim do arquivo) 

#### Critérios de avaliação do Grupo 1
Organização
Aplicaçào de técnicas 
Gramática
Clareza 
Outros aspectos...

## Grupo 2 - Testes automatizados

- Automação de frontend e backend usando a linguagem de programação e o framework a sua escolha;

- Boas práticas (patterns) serão consideradas;

- Cobrir pelo menos os critérios de aceitação descrito na história

- Markdown (readme.md) com a instrução de como executar o seu projeto será um diferencial;

- Caso escolha a linguagem de programação diferente para back e front, coloque tudo no mesmo projeto, em diretórios separados e especifique no Readme.md;

- Ao final, suba seu projeto no repositório do github, até o horário estipulado pela organização ( ver no fim do arquivo) 


#### Critérios de avaliação do Grupo 2

- Clean code
- Design Patterns 



## Premiação  

### Grupo 1 - Planejamento de testes
#### 1º lugar: 
- R$ 1000,00 + voucher ZenKlub + 1 curso da Iterasys a escolher.
#### 2º lugar: 
- R$ 500,00 + voucher ZenKlub + 1 curso da Iterasys a escolher.
#### 3º lugar: 
- R$ 300,00 + voucher ZenKlub + 1 curso da Iterasys a escolher.

### Grupo 2 - Automação de testes
#### 1º lugar:
- R$ 1200,00 + voucher Ambev  + 1 curso da Iterasys a escolher.
#### 2º lugar: 
- R$ 600,00 + voucher Ambev  + 1 curso da Iterasys a escolher.
#### 3º lugar: 
- R$ 400,00 + voucher Ambev  + 1 curso da Iterasys a escolher.

## Cronograma

#### Início
Sexta, dia 02/07 as 21hs

#### Entrega do desafio
Até as 9hs da manhã de Sábado, dia 03/07.

Obs. Você terá a noite inteira para desenvolver seu projeto. 

### Divulgação dos ganhadores
Sábado, dia 03/06, as 18hs

### Envio do Desafio:

- Envie um email com as seguintes informaçõeso para o email desafio.virada@gmail.com
  
  - Titulo: [**SEU_NOME COMPLETO** - DESAFIO_DA_VIRADA]
  
  - Corpo do email: Coloque o link do seu github 
    - **não esqueça que o seu repositório deve ser PUBLICO.**  






