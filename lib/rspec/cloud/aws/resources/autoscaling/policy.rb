module RSpec::Cloud::Aws::Resources
  class Policy < Base
    def current_resource
      @response ||= autoscaling.describe_policies('PolicyNames' => @name).data[:body]['DescribePoliciesResult']['ScalingPolicies']
      @resource   = @response.first if response.length == 1
    end

    def resource_name
      %(Auto scaling policy)
    end
  end
end
