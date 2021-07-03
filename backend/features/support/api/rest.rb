module Services
  class Rest
    def initialize
      @headers = {}
    end

    def post(endpoint:, body:, headers: nil)
      @endpoint = set_endpoint(endpoint)
      puts "\nPOST => #{@endpoint}"
      @headers = @headers.merge('Content-Type' => 'application/json')
      @headers = @headers.merge(headers) if headers
      HTTParty.post(
        @endpoint,
        headers: @headers,
        body: body.to_json
      )
    end

    def get(endpoint:, headers: nil)
      @endpoint = set_endpoint(endpoint)
      puts "\nGET => #{@endpoint}"
      @headers = @headers.merge('Accept' => 'application/json')
      @headers = @headers.merge(headers) if headers
      HTTParty.get(
        @endpoint,
        headers: @headers
      )
    end

    def set_endpoint(e)
      "#{$url}#{e}"
    end

    def set_jwt(jwt)
      @headers['Cookie'] = "jwt=#{jwt}"
    end
  end
end
