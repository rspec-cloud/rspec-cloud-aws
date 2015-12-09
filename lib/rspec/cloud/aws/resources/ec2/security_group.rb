module RSpec::Cloud::Aws::Resources
  class SecurityGroup < Base
    def current_resource
      @response ||= ec2.describe_security_groups('tag:Name' => @name).data[:body]['securityGroupInfo']
      @resource   = @response.first if @response.length == 1
      @identifier = 'groupId'
    end

    def default?
      @resource['groupName'] == 'default'
    end

    def resource_name
      %(Security group)
    end
  end
end
