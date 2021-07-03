#language: pt

@perfil
@criar_perfil
Funcionalidade: Perfil

  Contexto: Cadastro e acesso a criação de perfil
    Dado que esteja cadastrado
    Quando acessar criação de perfil

    @criar_perfil_valido
    Cenário: Criar perfil com dados válidos
      Quando criar perfil com dados válidos
      Então o perfil deverá ser criado com sucesso

    @criar_perfil_invalido
    Esquema do Cenário: Criar perfil com dados inválidos
      Quando criar perfil com erro '<erro>'
      Então deverá ser exibida a mensagem de erro '<mensagem>'

      Exemplos:
        | erro                    | mensagem                    |
        | status em branco        | Status é obrigatório        |
        | conhecimentos em branco | Conhecimentos é obrigatório |
        | website inválido        | Digite uma url válida       |
        | twitter inválido        | Digite uma url válida       |
        | facebook inválido       | Digite uma url válida       |
        | youtube inválido        | Digite uma url válida       |
        | linkedin inválido       | Digite uma url válida       |
        | instagram inválido      | Digite uma url válida       |
        | medium inválido         | Digite uma url válida       |
