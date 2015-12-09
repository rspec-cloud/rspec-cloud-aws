module RSpec::Cloud::Aws::Resources
  class LoadBalancerAttributes < Base
    def current_resource
      @response ||= elb.describe_load_balancer_attributes(@name).data[:body]['DescribeLoadBalancerAttributesResult']['LoadBalancerAttributes']
      @resource   = @response.first if @response.length == 1
    end

    def resource_name
      %(Load balancer attributes)
    end
  end
end
