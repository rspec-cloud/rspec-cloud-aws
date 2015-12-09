module RSpec::Cloud::Aws::Resources
  class InstanceProfile < Base
    def current_resource
      @response ||= iam.get_instance_profile(@name).data[:body]
      @resource   = @response['InstanceProfile'] if @response.key?('InstanceProfile')
      @identifier = 'InstanceProfileId'
    end

    def resource_name
      %(Instance profile)
    end
  end
end
