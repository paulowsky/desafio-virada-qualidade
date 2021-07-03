Quando('acessar criação de perfil') do
  @dashboard.acessar_criacao_perfil
  step 'deverá ser exibida a página de perfil'
end

Então('deverá ser exibida a página de perfil') do
  @perfil = $pages.perfil
  expect(@perfil.get_title).to eql 'Crie Seu Perfil'
end

Quando('criar perfil com dados válidos') do
  @perfil_criado = @perfil.criar_perfil
end

Então('o perfil deverá ser criado com sucesso') do
  @dashboard.acessar_edicao_perfil
  @dados_perfil = @perfil.get_data
  expect(@dados_perfil).to eql @perfil_criado
end

Quando('criar perfil com erro {string}') do |erro|
  @perfil_criado_error = @perfil.criar_perfil(erro)
end
