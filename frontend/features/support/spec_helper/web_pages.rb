Dir[File.join(File.dirname(__FILE__), 'page_objects/web/pages/*.rb')]
  .sort.each { |file| require file }

module Web
  module Pages
    class WebPages
      class << self
        def home
          Web::Pages::Home.new
        end

        def cadastro
          Web::Pages::Cadastro.new
        end

        def login
          Web::Pages::Login.new
        end

        def dashboard
          Web::Pages::Dashboard.new
        end

        def perfil
          Web::Pages::Perfil.new
        end
      end
    end
  end
end
