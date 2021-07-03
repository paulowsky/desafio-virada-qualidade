Dado('que esteja na página de login') do
  step 'que esteja na home'
  @home.acessar_login
  step 'deverá ser exibida a página de login'
end

Então('deverá ser exibida a página de login') do
  @login = $pages.login
  expect(@login.get_title).to eql 'Login'
end

Quando('acessar cadastro pela página de login') do
  @login.acessar_cadastro
end

Quando('realizar login') do
  @user = @login.realizar_login
  @dashboard = $pages.dashboard
end

Então('deverá ser exibido o nome do usuário na dashboard') do
  expect(@dashboard.get_welcome_text).to eql "Bem-vindo #{@user[:name]}"
end

Quando('realizar login com erro {string}') do |erro|
  @user_error = @login.realizar_login(erro)
end

Então('deverá ser exibida a mensagem de erro {string}') do |mensagem|
  sleep 1
  expect(page).to have_content mensagem
end
