module Web
  module Pages
    class Perfil < SitePrism::Page
      set_url '/criar-perfil'

      element :select_status, '#mui-component-select-status'
      elements :select_status_items, 'ul.MuiList-root li'
      element :input_website, '[name="website"]'
      element :input_conhecimentos, '[name="skills"]'
      element :btn_redes_sociais, '[data-test="profile-socials"]'
      element :input_twitter, '[name="twitter"]'
      element :input_facebook, '[name="facebook"]'
      element :input_youtube, '[name="youtube"]'
      element :input_linkedin, '[name="linkedin"]'
      element :input_instagram, '[name="instagram"]'
      element :input_medium, '[name="medium"]'
      element :btn_criar, '[data-test="profile-submit"]'
      element :span_title, 'section h1'

      def generate_profile(err)
        @profile = Factory::Dynamic.profile(error: err)
      end

      def criar_perfil(err=nil)
        generate_profile(err)

        if err != 'status em branco'
          select_status.gclick
          select_status_items.each {|select| select.gclick if select.text == @profile[:status]}
        end

        input_website.gset @profile[:website]
        input_conhecimentos.gset @profile[:conhecimentos]

        btn_redes_sociais.scroll_into_view
        btn_redes_sociais.click
        btn_redes_sociais.click if err == 'conhecimentos em branco'
        input_twitter.gset @profile[:twitter]
        input_facebook.gset @profile[:facebook]
        input_youtube.gset @profile[:youtube]
        input_linkedin.gset @profile[:linkedin]
        input_instagram.gset @profile[:instagram]
        input_medium.gset @profile[:medium]
        btn_criar.gclick
        @profile
      end

      def get_title
        span_title.text
      end

      def get_data
        btn_redes_sociais.gclick
        {
          :status => select_status.text,
          :website => input_website['value'],
          :conhecimentos => input_conhecimentos['value'],
          :twitter => input_twitter['value'],
          :facebook => input_facebook['value'],
          :youtube => input_youtube['value'],
          :linkedin => input_linkedin['value'],
          :instagram => input_instagram['value'],
          :medium => input_medium['value']
        }
      end
    end
  end
end
