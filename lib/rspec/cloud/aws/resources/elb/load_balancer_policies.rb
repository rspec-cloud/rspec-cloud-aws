module RSpec::Cloud::Aws::Resources
  class LoadBalancerPolicies < Base
    def current_resource
      @response ||= elb.describe_load_balancer_policies(@name).data[:body]['DescribeLoadBalancerPoliciesResult']['PolicyDescriptions']
      @resource   = @response.first if @response.length == 1
    end

    def resource_name
      %(Load balancer policies)
    end
  end
end
