require 'rspec/cloud/aws/resources/base/id'
require 'rspec/cloud/aws/resources/base/setup'

module RSpec::Cloud::Aws::Resources
  module Support
    def generate_boolean_for(name)
      method_name = "#{name.to_snake_case}?"
      logger.debug "Defining method #{method_name}"

      define_singleton_method(method_name.to_sym) do
        logger.debug "Verifying name #{name} in method #{method_name} for #{self}"
        result = nil
        result = @resource[name] if valid? && @resource.key?(name)
        logger.debug "Got result #{result} verifying #{name} in method #{method_name} for #{self}"
        result
      end
    end

    def generate_for(name)
      method_name = "#{name.to_snake_case}"
      logger.debug "Defining method #{method_name}"

      define_singleton_method(method_name.to_sym) do
        logger.debug "Verifying name #{name} in method #{method_name} for #{self}"
        result = nil
        result = @resource[name] if valid? && @resource.key?(name)
        logger.debug "Got result #{result} verifying #{name} in method #{method_name} for #{self}"
        result = result.to_i if result.is_a?(String) && result.integer?
        result
      end
    end

    def setup
      current_resource
      @resource.each_key do |key|
        if %w(TrueClass FalseClass).include? @resource[key].class.to_s
          generate_boolean_for(key)
        else
          generate_for(key)
        end
      end if verify_response
    end

    def verify_response
      fail "Got no result for #{self}: #{response}" if @response.length < 1
      fail "Got more than one result for #{self}: #{response}" if @response.length > 1
      true
    end
  end
end
