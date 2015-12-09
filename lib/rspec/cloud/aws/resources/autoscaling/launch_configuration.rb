module RSpec::Cloud::Aws::Resources
  class LaunchConfiguration < Base
    def current_resource
      @response ||= autoscaling.describe_launch_configurations('LaunchConfigurationNames' => [@name]).data[:body]['DescribeLaunchConfigurationsResponse']['LaunchConfigurations']
      @resource   = @response.first if @response.length == 1
    end

    def resource_name
      %(Placement group)
    end
  end
end
