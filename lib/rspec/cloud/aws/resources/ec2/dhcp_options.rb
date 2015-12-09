module RSpec::Cloud::Aws::Resources
  class DhcpOptions < Base
    def current_resource
      @response ||= ec2.describe_dhcp_options('tag:Name' => @name).data[:body]['dhcpOptionsSet']
      @resource   = @response.first if @response.length == 1
      @identifier = 'dhcpOptionsId'
    end

    def resource_name
      %(DHCP options)
    end
  end
end
