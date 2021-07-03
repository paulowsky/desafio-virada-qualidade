# frozen_string_literal: true

require_relative 'simple_js_runnable.rb'

module PageHelper
  module ElementMapper
    def self.included(object)
      object.extend(ElementMapper)
    end

    def deep_elements(name, find_args)
      define_method(name) do
        Capybara.page.evaluate_script("document.querySelectorAll('#{find_args}')").to_a
      end
    end

    def deep_element(name, find_args)
      define_method(name) do
        Capybara.page.evaluate_script("document.querySelector('#{find_args}')")
      end
    end
  end
end
