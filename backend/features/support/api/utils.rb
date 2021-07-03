class Utils
  def validate_schema(service, scenario, status, response)
    validation_schema = eval(File.read("#{$project_root}/features/schemas/#{TARGET}/#{service}/#{scenario}/#{status}.schema"))
    JSON::Validator.validate!(validation_schema, response.to_s)
  end

  def show_request(json_obj)
    "\n->-> REQUEST:\n#{JSON.pretty_generate(json_obj)}\n"
  end

  def show_response(hash_obj)
    "\n<-<- RESPONSE:\n#{JSON.pretty_generate(JSON.parse(hash_obj.to_s.force_encoding('UTF-8')))}\n"
  end
end
