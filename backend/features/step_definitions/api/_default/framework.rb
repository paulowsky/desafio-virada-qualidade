Dado('que possua os dados {string} do tipo {string} para o cenário {string} do serviço {string}') do |dados, type, cenario, servico|
  @tipo_dados = dados
  dados = {:data => dados, :type => type}
  @servico = servico
  @cenario = cenario
  @dados = load_data(dados, servico, cenario)
  @headers = {}
end

Dado('que possua dados de validação para o cenário {string} do serviço {string}') do |cenario, servico|
  @servico = servico
  @cenario = cenario
  @headers = {}
end

Dado('que possua os headers:') do |headers|
  @headers = headers.rows_hash
end

Quando('que possua os campos {string} únicos') do |unicos|
  @dados = inject_data(@dados, unicos)
end

Quando('fazer uma requisição') do
  puts @utils.show_request(@dados)
  @service = $services.send(@servico.downcase)
  @service.set_headers(@headers)
  @response = @service.send(@cenario.downcase, @dados)
end

Então('deverá receber a response status {string}') do |status|
  puts @utils.show_response(@response)
  expect(@response.code).to eql status.to_i
  expect(@utils.validate_schema(@servico, @cenario, status, @response)).to be true
end

Dado('que esteja logado') do
  steps %{
    Dado que possua os dados 'valido' do tipo 'static' para o cenário 'login' do serviço 'auth'
    Quando fazer uma requisição
    Então deverá receber a response status '200'
    E deverá retornar os dados corretos para o cenário login do serviço auth status '200'
  }
end

Dado('que esteja cadastrado') do
  steps %{
    Dado que possua os dados 'valido' do tipo 'static' para o cenário 'register' do serviço 'users'
    E que possua os campos 'email' únicos
    Quando fazer uma requisição
    Então deverá receber a response status '201'
    E deverá retornar os dados corretos para o cenário register do serviço users status '201'
  }
end
