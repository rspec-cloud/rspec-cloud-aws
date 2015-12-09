module RSpec::Cloud::Aws::Resources
  class AutoScalingInstance < Base
    def current_resource
      @response ||= autoscaling.describe_auto_scaling_groups('InstanceIds' => [@name]).data[:body]['DescribeAutoScalingInstancesResponse']['AutoScalingInstances']
      @resource   = @response.first if @response.length == 1
    end

    def resource_name
      %(Auto scaling instance)
    end
  end
end
