module RSpec::Cloud::Aws::Resources
  class AutoScalingNotificationType < Base
    def current_resource
      @response ||= autoscaling.describe_auto_scaling_notification_types.data[:body]['DescribeAutoScalingNotificationTypesResult']
      @resource   = @response
    end

    def resource_name
      %(Auto scaling notification type)
    end
  end
end
