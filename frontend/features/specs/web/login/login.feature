#language: pt

@autenticação
@login
Funcionalidade: Autenticação

  Contexto: Acesso a página de login
    Dado que esteja na página de login

    @login_acesso_cadastro
    Cenário: Acessar cadastro através do login
      Quando acessar cadastro pela página de login
      Então deverá ser exibida a página de cadastro

    @login_valido
    Cenário: Realizar login com dados válidos
      Quando realizar login
      Então deverá ser exibido o nome do usuário na dashboard

    @login_invalido
    Esquema do Cenário: Realizar login com dados inválidos
      Quando realizar login com erro '<erro>'
      Então deverá ser exibida a mensagem de erro '<mensagem>'

      Exemplos:
        | erro            | mensagem                                   |
        | email em branco | Email é obrigatório                        |
        | senha em branco | Senha é obrigatória                        |
        | email inválido  | Digite um email válido                     |
        | senha curta     | A senha deve conter no mínimo 6 caracteres |
        | dados inválidos | Credenciais inválidas                      |
