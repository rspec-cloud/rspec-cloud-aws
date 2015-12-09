module RSpec::Cloud::Aws::Resources
  class InternetGateway < Base
    def available?
      valid? && @resource.key?('attachmentSet') && @resource['attachmentSet'].key?('state') && @resource['attachmentSet']['state'] == 'available'
    end

    def current_resource
      @response ||= ec2.describe_internet_gateways('tag:Name' => @name).data[:body]['internetGatewaySet']
      @resource   = @response.first if @response.length == 1
      @identifier = 'internetGatewayId'
    end

    def resource_name
      %(Internet gateway)
    end

    def vpc_id
      result = nil
      result = @resource['attachmentSet']['vpcId'] if valid? && @resource.key?('attachmentSet') && @resource['attachmentSet'].key?('vpcId')
      result
    end
  end
end
