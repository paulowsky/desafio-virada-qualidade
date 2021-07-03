module Web
  module Pages
    class Login < SitePrism::Page
      set_url '/login'

      element :input_email, '[name="email"]'
      element :input_password, '[name="password"]'
      element :btn_login, '[data-test="login-submit"]'
      element :btn_acessar_cadastro, '[data-test="login-register"]'
      element :span_title, 'section h1'

      def generate_user(err)
        @user = err == nil ? Factory::Static.static_data(:login) : Factory::Dynamic.user(error: err)
      end

      def realizar_login(err=nil)
        generate_user(err)
        input_email.gset @user[:email]
        input_password.gset @user[:password]
        sleep 1
        btn_login.gclick
        @user
      end

      def acessar_cadastro
        btn_acessar_cadastro.gclick
      end

      def get_title
        span_title.text
      end
    end
  end
end
