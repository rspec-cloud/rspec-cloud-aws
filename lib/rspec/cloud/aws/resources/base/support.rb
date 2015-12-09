require 'rspec/cloud/aws/resources/base/id'
require 'rspec/cloud/aws/resources/base/setup'

module RSpec::Cloud::Aws::Resources
  module Support
    def resource_name
      self.class.name.split(':')[-1]
    end

    def logger
      @logger ||= Logger.new(STDOUT)
      @logger.level = RSpec.configuration.log_level || Logger::DEBUG
      @logger
    end

    def region
      RSpec.configuration.region
    end

    def use_iam_profile?
      RSpec.configuration.use_iam_profile
    end

    def to_s
      %(#{resource_name} "#{@name}")
    end

    def valid?
      ! @resource.nil?
    end
  end
end
