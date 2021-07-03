#language :pt

@api
@users
Funcionalidade: Users

  @users_register
  # POST -> /users
  Esquema do Cenário: Validar criação de usuário
    Dado que possua os dados '<dados>' do tipo '<tipo>' para o cenário '<cenario>' do serviço '<servico>'
    E que possua os campos '<unicos>' únicos
    Quando fazer uma requisição
    Então deverá receber a response status '<status>'
    E deverá retornar os dados corretos para o cenário register do serviço users status '<status>'

    Exemplos:
      | servico | cenario  | dados            | unicos | tipo   | status |
      | users   | register | valido           | email  | static | 201    |
      | users   | register | body-vazio       |        | static | 400    |
      | users   | register | email-registrado |        | static | 400    |
      | users   | register | senha-curta      | email  | static | 400    |
      | users   | register | email-invalido   |        | static | 400    |
