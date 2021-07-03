require_relative 'simple_js_runnable.rb'

Dir[File.join(File.dirname(__FILE__), 'js_*.rb')]
  .sort.each { |file| require file }

module Capybara
  module Node
    class Element
      # Work around SitePrism's/RSpec's inconsistent api
      # Make helper methods work both on elements and sections/pages
      def root_element
        self
      end

      include PageHelper::JsUsableElement
    end
  end
end

module SitePrism
  class Section
    include PageHelper::JsUsableElement
    include PageHelper::JsUsablePage
    include PageHelper::ElementMapper
  end

  class Page
    include PageHelper::JsUsablePage
    include PageHelper::KillPopUps
    include PageHelper::ElementMapper
  end
end
