module Web
  module Pages
    class Cadastro < SitePrism::Page
      set_url '/cadastrar'

      element :input_name, '[name="name"]'
      element :input_email, '[name="email"]'
      element :input_password, '[name="password"]'
      element :input_password_confirm, '[name="password2"]'
      element :btn_cadastrar, '[data-test="register-submit"]'
      element :btn_acessar_login, '[data-test="register-login"]'
      element :span_title, 'section h1'

      def generate_user(err)
        @user = Factory::Dynamic.user(error: err)
      end

      def realizar_cadastro(err=nil)
        generate_user(err)
        input_name.gset @user[:name]
        input_email.gset @user[:email]
        input_password.gset @user[:password]
        input_password_confirm.gset @user[:password_confirm]
        btn_cadastrar.gclick
        @user
      end

      def acessar_login
        btn_acessar_login.gclick
      end

      def get_title
        span_title.text
      end
    end
  end
end
