module RSpec::Cloud::Aws::Resources
  class Base
    include ::RSpec::Cloud::Aws::Resources::Support
    include ::RSpec::Cloud::Aws::Services

    attr_reader :identifier, :name, :response, :resource

    def initialize(name = nil, value = nil)
      @identifier = nil
      @name       = name
      @value      = value
      @properties = []
      logger.debug("Initialized #{resource_name} with name \"#{@name}\" in region: #{region}")
      setup
      logger.debug "Got #{self} resource #{@resource}"
      logger.debug("Initialized #{self} with methods: #{singleton_methods}")
      logger.debug("Initialized #{self} with methods: #{methods}")
    end
  end
end
