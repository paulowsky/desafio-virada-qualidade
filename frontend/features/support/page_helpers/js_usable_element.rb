require_relative 'simple_js_runnable.rb'

module PageHelper
  module Greenable
    include SimpleJsRunnable

    #
    # Cria uma borda verde em volta do
    # elemento para destacá-lo.
    #
    def greenify
      js("self.setAttribute('style','border: 3px solid #15a50d')")
    end

    #
    # Clica no elemento, deixando-o destacado em verde.
    #
    def gclick
      greenify
      click
    end

    #
    # Seta um valor em um campo, deixando-o destacado em verde.
    #
    # @param string value
    #   O valor a ser setado no elemento selecionado
    #
    def gset(value)
      greenify
      set ''
      set value
    end

    #
    # Seta um valor em um campo com mascara.
    #
    # @param string value
    #   O valor a ser setado no elemento selecionado
    #
    def sclick(_file_name = '', _result = 'passed')
      greenify
      click
    end
  end

  module Showable
    include SimpleJsRunnable

    #
    # Encontra um elemento e faz scroll para que fique visível no meio da página.
    #
    def scroll_into_view
      js('self.scrollIntoView();')
    end
  end

  module Settable
    include SimpleJsRunnable

    #
    # Seta um valor em um campo com mascara.
    # (esse método foi construído com JQuery
    # e precisa dele disponível no site para funcionar)
    #
    # @param string value
    #   O valor a ser setado no elemento selecionado
    #
    def set_value_with_mask(value)
      jquery("self.val('#{value}').trigger('keyup')")
    end
  end

  module JsUsableElement
    include Greenable
    include Showable
    include Settable
  end
end
