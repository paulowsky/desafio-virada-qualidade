#language :pt

@api
@profile
Funcionalidade: Profile

  @profile_create
  # POST -> /profile
  Esquema do Cenário: Validar criação de perfil
    Dado que esteja cadastrado
    E que possua os dados '<dados>' do tipo '<tipo>' para o cenário '<cenario>' do serviço '<servico>'
    Quando fazer uma requisição
    Então deverá receber a response status '<status>'
    E deverá retornar os dados corretos para o cenário create do serviço profile status '<status>'

    Exemplos:
      | servico | cenario | dados            | tipo   | status |
      | profile | create  | valido           | static | 200    |
      | profile | create  | body-vazio       | static | 400    |
      | profile | create  | status-invalido  | static | 400    |
      | profile | create  | skills-invalidas | static | 400    |
      | profile | create  | website-invalido | static | 400    |
