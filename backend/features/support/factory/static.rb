module Factory
  class Static
    def self.load_file(service, scenario)
      JSON.parse(File.read(File.dirname(__FILE__) +"/static/#{TARGET}/#{service}/#{scenario}.json"))
    end

    def self.static_data(service, scenario, data)
      Static.load_file(service, scenario)[data]
    end
  end
end
