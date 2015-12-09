module RSpec::Cloud::Aws::Resources
  class Volume < Base
    def available?
      valid? && @resource.key?('status') && @resource['status'] == 'available'
    end

    def current_resource
      @response ||= ec2.describe_volumes('tag:Name' => @name).data[:body]['volumeSet']
      @resource   = @response.first if @response.length == 1
      @identifier = 'volumeId'
    end
  end
end
