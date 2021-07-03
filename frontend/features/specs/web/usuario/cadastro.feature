#language: pt

@usuario
@cadastro
Funcionalidade: Usuario

  Contexto: Acesso a página de cadastro
    Dado que esteja na página de cadastro

    @cadastro_acesso_login
    Cenário: Acessar login através do cadastro
      Quando acessar login pela página de cadastro
      Então deverá ser exibida a página de login

    @cadastro_valido
    Cenário: Realizar cadastro com dados válidos
      Quando realizar cadastro com usuário válido
      Então deverá ser exibido o nome do usuário na dashboard

    @cadastro_invalido
    Esquema do Cenário: Realizar cadastro com dados inválidos
      Quando realizar cadastro com erro '<erro>'
      Então deverá ser exibida a mensagem de erro '<mensagem>'

      Exemplos:
        | erro                    | mensagem                                   |
        | nome em branco          | Nome é obrigatório                         |
        | email em branco         | Email é obrigatório                        |
        | senha em branco         | Senha é obrigatória                        |
        | senha confirm em branco | Confirmar senha é obrigatória              |
        | email inválido          | Digite um email válido                     |
        | senha curta             | A senha deve conter no mínimo 6 caracteres |
        | senhas diferentes       | Senhas precisam ser idênticas              |
