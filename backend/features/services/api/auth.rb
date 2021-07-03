module Services
  class Auth
    def initialize
      @headers = {}
      @endpoint = '/auth'
    end

    def set_headers(headers)
      @headers = @headers.merge(headers) if headers
    end

    def login_verify
      $rest.get(endpoint: @endpoint, headers: @headers)
    end

    def login(body)
      $rest.post(endpoint: @endpoint, body: body, headers: @headers)
    end
  end
end
