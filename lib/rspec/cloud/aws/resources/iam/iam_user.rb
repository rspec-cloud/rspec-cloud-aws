module RSpec::Cloud::Aws::Resources
  class IamUser < Base
    def current_resource
      @response ||= iam.get_user(@name).data[:body]
      @resource   = @response['User'] if @response.key?('User')
      @identifier = 'UserId'
    end

    def resource_name
      %(IAM user)
    end

    def verify_response
      @response.key?('User')
    end
  end
end
