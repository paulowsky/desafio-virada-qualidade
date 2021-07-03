module Factory
  class Injector
    def self.inject_data(static_data, inject)
      dynamic_data = Factory::Dynamic.generate
      static_data[inject] = dynamic_data[inject.to_sym]
      static_data
    end
  end
end
