Então('deverá retornar os dados corretos para o cenário register do serviço users status {string}') do |status|
  case status
  when '201'
    expect(@response['jwt']).to be_truthy
    @service = $services.send('auth')
    save_jwt(@response['jwt'])
    @response = @service.send('login_verify')
    expect(@response['email']).to eql @dados['email']
    expect(@response['name']).to eql @dados['name']

  when '400'
    case @tipo_dados
    when 'body-vazio'
      expect(@response['errors'][0]['msg']).to eql 'Nome é obrigatório'
      expect(@response['errors'][0]['param']).to eql 'name'
      expect(@response['errors'][1]['msg']).to eql 'Por favor inclua um email válido'
      expect(@response['errors'][1]['param']).to eql 'email'
      expect(@response['errors'][2]['msg']).to eql 'Por favor entre com uma senha de 6 caracteres ou mais'
      expect(@response['errors'][2]['param']).to eql 'password'

    when 'email-registrado'
      expect(@response['errors'][0]['msg']).to eql 'Usuário já registrado'

    when 'senha-curta'
      expect(@response['errors'][0]['msg']).to eql 'Por favor entre com uma senha de 6 caracteres ou mais'

    when 'email-invalido'
      expect(@response['errors'][0]['msg']).to eql 'Por favor inclua um email válido'

    else
      raise 'ERROR: datatype not supported!'
    end

  else
    raise 'ERROR: status not supported!'
  end
end
