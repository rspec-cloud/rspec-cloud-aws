module RSpec::Cloud::Aws::Resources
  class AutoScalingGroup < Base
    def current_resource
      @response ||= autoscaling.describe_auto_scaling_groups('AutoScalingGroupNames' => [@name]).data[:body]['DescribeAutoScalingGroupsResult']['AutoScalingGroups']
      @resource   = @response.first if @response.length == 1
    end

    def resource_name
      %(Auto scaling group)
    end
  end
end
