module RSpec::Cloud::Aws::Resources
  class ScheduledAction < Base
    def current_resource
      @response ||= autoscaling.describe_scheduled_actions('ScheduledActionNames' => @name).data[:body]['DescribeScheduledActionsResponse']['ScheduledUpdateGroupActions']
      @resource   = @response.first if response.length == 1
    end

    def resource_name
      %(Scheduled action)
    end
  end
end
