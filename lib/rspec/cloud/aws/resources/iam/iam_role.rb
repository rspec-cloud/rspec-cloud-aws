module RSpec::Cloud::Aws::Resources
  class IamRole < Base
    def current_resource
      @response ||= iam.get_role(@name).data[:body]
      @resource   = @response['Role'] if @response.key?('Role')
      @identifier = 'RoleId'
    end

    def resource_name
      %(IAM role)
    end

    def verify_response
      @response.key?('Role')
    end
  end
end
