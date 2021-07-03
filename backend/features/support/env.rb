require 'cucumber'
require 'httparty'
require 'yaml'
require 'json'
require 'jsonpath'
require 'json-schema'
require 'rspec'
require 'pry'

TARGET ||= ENV['TARGET']
ISPARALLELRUNNING ||= ENV['PARALLELRUNNING']

TARGET_DATA = YAML.load_file(File.dirname(__FILE__) + "/env/api/#{TARGET}.yml")

$url = TARGET_DATA[:url]

puts "URL: #{$url}"

$project_root = File.expand_path(File.join(File.dirname(__FILE__), '/../..'))
