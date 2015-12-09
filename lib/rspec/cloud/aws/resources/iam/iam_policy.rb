module RSpec::Cloud::Aws::Resources
  class IamPolicy < Base
    def current_resource
      @response ||= iam.get_policy(@name).data[:body]
      logger.debug @response
      @resource   = @response['Policy']
      @identifier = 'PolicyId'
    end

    def resource_name
      %(IAM policy)
    end

    def verify_response
      @response.key?('Policy')
    end
  end
end
