module Web
  module Pages
    class Home < SitePrism::Page
      set_url '/'

      element :btn_acessar_cadastro, '[data-test="landing-register"]'
      element :btn_acessar_login, '[data-test="landing-login"]'

      def acessar_cadastro
        btn_acessar_cadastro.gclick
      end

      def acessar_login
        btn_acessar_login.gclick
      end
    end
  end
end
