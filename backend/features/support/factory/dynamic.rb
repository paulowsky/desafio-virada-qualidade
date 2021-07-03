require 'brazilian_documents'
require 'cpf_faker'
require 'faker'

module Factory
  class Dynamic
    def self.with_error(data, error)
      case error
      when 'cpf invalido'
        data[:cpf] = '99999999999'
      when 'cpf em branco'
        data[:cpf] = ''
      when 'email invalido'
        data[:email] = 'fgongow@'
      when 'email em branco'
        data[:email] = ''
      end
      data
    end

    def self.generate(error = nil)
      data = {
        :fullName => "Test Automation #{Faker::Name.first_name}",
        :email => "teste.#{Faker::Name.first_name}.#{rand(9999)}@mail.com"
      }

      data = Dynamic.with_error(data, error) if error

      data
    end
  end
end
