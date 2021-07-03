module Services
  class Profile
    def initialize
      @headers = {}
      @endpoint = '/profile'
    end

    def set_headers(headers)
      @headers = @headers.merge(headers) if headers
    end

    def create(body)
      $rest.post(endpoint: @endpoint, body: body, headers: @headers)
    end
  end
end
