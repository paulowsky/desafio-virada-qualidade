Dado('que esteja na página de cadastro') do
  step 'que esteja na home'
  @home.acessar_cadastro
  step 'deverá ser exibida a página de cadastro'
end

Então('deverá ser exibida a página de cadastro') do
  @cadastro = $pages.cadastro
  expect(@cadastro.get_title).to eql 'Cadastrar'
end

Quando('acessar login pela página de cadastro') do
  @cadastro.acessar_login
end

Quando('realizar cadastro com usuário válido') do
  @user = @cadastro.realizar_cadastro
  @dashboard = $pages.dashboard
end

Quando('realizar cadastro com erro {string}') do |erro|
  @user_error = @cadastro.realizar_cadastro(erro)
end

Dado('que esteja cadastrado') do
  steps %{
    Dado que esteja na página de cadastro
    Quando realizar cadastro com usuário válido
    Então deverá ser exibido o nome do usuário na dashboard
  }
end
