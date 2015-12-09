module RSpec::Cloud::Aws::Resources
  class Vpc < Base
    def available?
      valid? && @resource.key?('state') && @resource['state'] == 'available'
    end

    def current_resource
      @response ||= ec2.describe_vpcs('tag:Name' => @name).data[:body]['vpcSet']
      @resource   = @response.first if @response.length == 1
      @identifier = 'vpcId'
    end

    def default?
      @resource['isDefault'] == 'true'
    end

    def resource_name
      %(VPC)
    end
  end
end
