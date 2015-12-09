module RSpec::Cloud::Aws::Resources
  class NetworkInterface < Base
    def current_resource
      @response ||= ec2.describe_network_interfaces('tag:Name' => @name).data[:body]['networkInterfaceSet']
      logger.debug @response
      @resource   = @response.first if @response.length == 1
      @identifier = 'networkInterfaceId'
    end

    def resource_name
      %(Network interface)
    end
  end
end
