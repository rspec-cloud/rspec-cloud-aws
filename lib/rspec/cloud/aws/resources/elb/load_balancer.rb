module RSpec::Cloud::Aws::Resources
  class LoadBalancer < Base
    def current_resource
      @response ||= elb.describe_load_balancers(LoadBalancerNames => [@name]).data[:body]['DescribeLoadBalancersResult']['LoadBalancerDescriptions']
      @resource   = @response.first if @response.length == 1
    end

    def resource_name
      %(Load balancer)
    end
  end
end
