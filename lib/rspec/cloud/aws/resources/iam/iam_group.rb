module RSpec::Cloud::Aws::Resources
  class IamGroup < Base
    def current_resource
      @response ||= iam.get_group(@name).data[:body]
      @resource   = @response['Group'] if @response.key?('Group')
      @resource['Users']   = @response['Users'] if @response.key?('Users')
      @identifier = 'GroupId'
    end

    def resource_name
      %(IAM group)
    end

    def verify_response
      @response.key?('Group')
    end
  end
end
