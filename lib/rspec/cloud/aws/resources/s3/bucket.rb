module RSpec::Cloud::Aws::Resources
  class Bucket < Base
    def current_resource
      @response ||= s3.get_bucket(@name).data[:body]
      logger.debug @response
      @resource   = @response # if @response.key?('Contents')
      # @identifier = 'UserId'
    end

    def resource_name
      'Bucket'
    end

    def verify_response
      @response
    end
  end
end
