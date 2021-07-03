module Services
  class Users
    def initialize
      @headers = {}
      @endpoint = '/users'
    end

    def set_headers(headers)
      @headers = @headers.merge(headers) if headers
    end

    def register(body)
      $rest.post(endpoint: @endpoint, body: body, headers: @headers)
    end
  end
end
