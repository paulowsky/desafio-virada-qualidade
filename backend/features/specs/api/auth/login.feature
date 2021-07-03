#language :pt

@api
@auth
Funcionalidade: Authentication

  @auth_login
  # POST -> /auth
  Esquema do Cenário: Validar login
    Dado que possua os dados '<dados>' do tipo '<tipo>' para o cenário '<cenario>' do serviço '<servico>'
    Quando fazer uma requisição
    Então deverá receber a response status '<status>'
    E deverá retornar os dados corretos para o cenário login do serviço auth status '<status>'

    Exemplos:
      | servico | cenario | dados          | tipo   | status |
      | auth    | login   | valido         | static | 200    |
      | auth    | login   | body-vazio     | static | 400    |
      | auth    | login   | senha-errada   | static | 401    |
      | auth    | login   | senha-curta    | static | 401    |
      | auth    | login   | email-invalido | static | 400    |
