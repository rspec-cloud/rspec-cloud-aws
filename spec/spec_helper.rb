$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)
require 'rspec/cloud/aws'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
end

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.region    = 'eu-central-1'
  config.log_level = Logger::DEBUG
end
