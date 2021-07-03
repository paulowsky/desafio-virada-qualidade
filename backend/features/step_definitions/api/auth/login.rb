Então('deverá retornar os dados corretos para o cenário login do serviço auth status {string}') do |status|
  case status
  when '200'
    expect(@response['jwt']).to be_truthy
    @service = $services.send('auth')
    save_jwt(@response['jwt'])
    @response = @service.send('login_verify')
    expect(@response['email']).to eql @dados['email']
    expect(@response['name']).to eql @dados['name']

  when '400'
    case @tipo_dados
    when 'body-vazio'
      expect(@response['errors'][0]['msg']).to eql 'Por favor inclua um email válido'
      expect(@response['errors'][0]['param']).to eql 'email'
      expect(@response['errors'][1]['msg']).to eql 'Senha é obrigatória'
      expect(@response['errors'][1]['param']).to eql 'password'

    when 'email-invalido'
      expect(@response['errors'][0]['msg']).to eql 'Por favor inclua um email válido'

    else
      raise "ERROR: datatype '#{@tipo_dados}' not supported!"
    end

  when '401'
    case @tipo_dados
    when 'senha-errada'
      expect(@response['errors'][0]['msg']).to eql 'Credenciais inválidas'

    when 'senha-curta'
      expect(@response['errors'][0]['msg']).to eql 'Credenciais inválidas'

    else
      raise "ERROR: datatype '#{@tipo_dados}' not supported!"
    end

  else
    raise 'ERROR: status not supported!'
  end
end
