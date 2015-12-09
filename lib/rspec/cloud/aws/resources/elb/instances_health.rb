module RSpec::Cloud::Aws::Resources
  class InstanceHealth < Base
    def current_resource
      @response ||= elb.describe_instance_health(@name).data[:body]['DescribeInstanceHealthResult']['InstanceStates']
      @resource   = @response
    end

    def resource_name
      %(Instance health for load balancer)
    end
  end
end
