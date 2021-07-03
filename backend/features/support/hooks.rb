Dir[File.join(File.dirname(__FILE__), 'spec_helper/*.rb')]
  .sort.each { |file| require file }

$services = Services::ApiServices
features_root = File.join($project_root, '/features')
services_root = File.join(features_root, '/services')
$LOAD_PATH << features_root
$LOAD_PATH << services_root

def save_jwt(jwt)
  $rest.set_jwt(jwt)
end

def load_data(data, service, scenario)
  case data[:type]
  when 'static'
    Factory::Static.static_data(service, scenario, data[:data])
  when 'dynamic'
    Factory::Dynamic.dynamic_data(service, scenario, data[:data])
  else
    raise "ERROR: Factory not support this data type #{data[:type]}"
  end
end

def inject_data(data, inject)
  inject.split(',').each do |i|
    data = Factory::Injector.inject_data(data, i)
  end
  data
end

Before do
  $rest = Services::Rest.new
  @utils = Utils.new
end

if ISPARALLELRUNNING
  require 'parallel_tests'
  # preparation:
  # affected by race-condition: first process may boot slower than the second
  # either sleep a bit or use a lock for example File.lock
  ParallelTests.first_process? ? sleep(10) : sleep(1)

  at_exit do
    if ParallelTests.first_process?
      ParallelTests.wait_for_other_processes_to_finish
    end
  end
end
