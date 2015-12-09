module RSpec::Cloud::Aws::Resources
  class Address < Base
    def current_resource
      @response ||= ec2.describe_addresses('public-ip' => [@name]).data[:body]['addressesSet']
      @resource   = @response.first if @response.length == 1
    end

    def resource_name
      %(Address)
    end
  end
end
