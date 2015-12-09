module RSpec::Cloud::Aws::Resources
  class Subnet < Base
    def available?
      valid? && @resource.key?('state') && @resource['state'] == 'available'
    end

    def current_resource
      @response ||= ec2.describe_subnets('tag:Name' => @name).data[:body]['subnetSet']
      @resource   = @response.first if @response.length == 1
      @identifier = 'subnetId'
    end
  end
end
