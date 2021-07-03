require_relative 'simple_js_runnable.rb'

module PageHelper
  module Utils

    #
    # Realiza o scroll da página para o início.
    #
    def scroll_to_top
      js('window.scroll(0,0);')
    end

    #
    # Aguarda o ajax retornar na pagina, mantendo
    # um loop e não permitindo timeout.
    #
    def wait_ajax
      Timeout.timeout(Capybara.default_max_wait_time) do
        loop until Capybara.current_session.evaluate_script('jQuery.active').zero?
      end
    end
  end

  module JsUsablePage
    include Utils
  end
end
