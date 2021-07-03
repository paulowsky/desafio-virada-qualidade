module PageHelper
  module SimpleJsRunnable
    def locator
      root_element.instance_variable_get(:@query).locator
    end

    def js_anon_func(script, arg)
      '
      (function(root, document, self) {
          ' + script + '
      })(window, document, ' + arg + ');
      '
    end

    def jquery(script)
      Capybara.page.execute_script(
        js_anon_func(script, '$(arguments[0])'),
        root_element
      )
    end

    def js(script)
      # https://stackoverflow.com/a/26914170
      Capybara.page.execute_script(
        js_anon_func(script, 'arguments[0]'),
        root_element
      )
    end
  end
end
