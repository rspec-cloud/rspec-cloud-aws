module RSpec::Cloud::Aws::Resources
  class Alarm < Base
    def current_resource
      @response ||= cloudwatch.describe_alarms('AlarmNames' => [@name]).data[:body]['MetricAlarms']
      @resource   = @response.first if @response.length == 1
    end
  end
end
