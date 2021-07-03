require_relative '../../sections/headers/main_header'

module Web
  module Pages
    class Dashboard < SitePrism::Page
      set_url '/dashboard'

      element :span_welcome_name, '[data-test="dashboard-welcome"]'
      element :btn_criar_perfil, '[data-test="dashboard-createProfile"]'
      element :btn_editar_perfil, '[data-test="dashboard-editProfile"]'

      section :main_header, Web::Sections::MainHeader, 'nav.navbar'

      def get_welcome_text
        span_welcome_name.text
      end

      def acessar_criacao_perfil
        btn_criar_perfil.gclick
      end

      def acessar_edicao_perfil
        btn_editar_perfil.gclick
      end
    end
  end
end
