require 'brazilian_documents'
require 'cpf_faker'
require 'faker'

module Factory
  class Dynamic
    def self.with_error(data, error)
      case error
      when 'nome em branco'
        data[:name] = ''
      when 'email em branco'
        data[:email] = ''
      when 'senha em branco'
        data[:password] = ''
      when 'senha confirm em branco'
        data[:password_confirm] = ''
      when 'email inválido'
        data[:email] = 'email.com'
      when 'senha curta'
        data[:password] = '123'
      when 'senhas diferentes'
        data[:password_confirm] = '111111'
      when 'status em branco'
        data[:status] = ''
      when 'conhecimentos em branco'
        data[:conhecimentos] = ''
      when 'website inválido'
        data[:website] = 'oi'
      when 'twitter inválido'
        data[:twitter] = 'oi'
      when 'facebook inválido'
        data[:facebook] = 'oi'
      when 'youtube inválido'
        data[:youtube] = 'oi'
      when 'linkedin inválido'
        data[:linkedin] = 'oi'
      when 'instagram inválido'
        data[:instagram] = 'oi'
      when 'medium inválido'
        data[:medium] = 'oi'
      when 'dados inválidos'
        true
      else
        raise "ERROR: error '#{error}' not implemented!"
      end
      data
    end

    def self.user(error: nil)
      user = {
        :name => "Test Automation #{Faker::Name.first_name}",
        :email => "teste.#{Faker::Name.first_name}.#{rand(9999)}@mailsac.com",
        :password => '123123',
        :password_confirm => '123123'
      }

      user = Dynamic.with_error(user, error) if error

      user
    end

    def self.profile(error: nil)
      profile = {
        :status => 'Especialista em QA',
        :website => 'https://loopz.com.br',
        :conhecimentos => Faker::ProgrammingLanguage.name,
        :twitter => 'https://twitter.com',
        :facebook => 'https://facebook.com',
        :youtube => 'https://youtube.com',
        :linkedin => 'https://linkedin.com',
        :instagram => 'https://instagram.com',
        :medium => 'https://medium.com'
      }

      profile = Dynamic.with_error(profile, error) if error

      profile
    end
  end
end
