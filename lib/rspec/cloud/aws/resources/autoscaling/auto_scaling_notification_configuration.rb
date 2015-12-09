module RSpec::Cloud::Aws::Resources
  class AutoScalingNotificationConfiguration < Base
    def current_resource
      @response ||= autoscaling.describe_auto_scaling_notification_configuration.data[:body]['DescribeNotificationConfigurationsResult']['NotificationConfigurations']
      @resource   = @response.first if response.length == 1
    end

    def resource_name
      %(Auto scaling notification configuration)
    end
  end
end
