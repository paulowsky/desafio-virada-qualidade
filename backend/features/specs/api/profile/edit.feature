#language :pt

@api
@profile
Funcionalidade: Profile

  Contexto: Login
    Dado que esteja logado

    @profile_edit
    # POST -> /profile
    Esquema do Cenário: Validar edição de perfil
      Dado que possua os dados '<dados>' do tipo '<tipo>' para o cenário '<cenario>' do serviço '<servico>'
      Quando fazer uma requisição
      Então deverá receber a response status '<status>'
      E deverá retornar os dados corretos para o cenário create do serviço profile status '<status>'

      Exemplos:
        | servico | cenario | dados  | tipo   | status |
        | profile | create  | valido | static | 201    |
