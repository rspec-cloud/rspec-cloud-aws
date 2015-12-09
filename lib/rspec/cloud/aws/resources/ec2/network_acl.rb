module RSpec::Cloud::Aws::Resources
  class NetworkAcl < Base
    def current_resource
      @response ||= ec2.describe_network_acls('tag:Name' => @name).data[:body]['networkAclSet']
      @resource   = @response.first if @response.length == 1
      @identifier = 'networkAclId'
    end

    def resource_name
      %(Network ACL)
    end
  end
end
