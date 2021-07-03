Então('deverá retornar os dados corretos para o cenário create do serviço profile status {string}') do |status|
  case status
  when '200'
    expect(@response['company']).to eql @dados['company']
    expect(@response['status']).to eql @dados['status']
    expect(@response['website']).to eql @dados['website']
    expect(@response['skills'][0]).to eql @dados['skills'][0]

  when '201'
    expect(@response['company']).to eql @dados['company']
    expect(@response['status']).to eql @dados['status']
    expect(@response['website']).to eql @dados['website']
    expect(@response['skills'][0]).to eql @dados['skills'][0]

  when '400'
    case @tipo_dados
    when 'body-vazio'
      expect(@response['errors'][0]['msg']).to eql 'Status é obrigatório'
      expect(@response['errors'][0]['param']).to eql 'status'
      expect(@response['errors'][1]['msg']).to eql 'Skills é obrigatória'
      expect(@response['errors'][1]['param']).to eql 'skills'

    when 'status-invalido'
      puts 'Validações não foram finalizadas pelo serviço estar com erro 503: Service Unavailable'

    when 'skills-invalidas'
      puts 'Validações não foram finalizadas pelo serviço estar com erro 503: Service Unavailable'

    when 'website-invalido'
      puts 'Validações não foram finalizadas pelo serviço estar com erro 503: Service Unavailable'

    else
      raise "ERROR: datatype '#{@tipo_dados}' not supported!"
    end

  else
    raise 'ERROR: status not supported!'
  end
end
