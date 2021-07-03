Dir[File.join(File.dirname(__FILE__), 'services/*.rb')]
  .sort.each { |file| require file }

module Services
  class ApiServices
    class << self
      def users
        Services::Users.new
      end

      def auth
        Services::Auth.new
      end

      def profile
        Services::Profile.new
      end
    end
  end
end
