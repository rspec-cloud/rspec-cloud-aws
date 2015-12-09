module RSpec::Cloud::Aws::Resources
  class KeyPair < Base
    def current_resource
      @response ||= ec2.describe_key_pairs('key-name' => @name).data[:body]['keySet']
      @resource   = @response.first if @response.length == 1
    end

    def resource_name
      %(Key pair)
    end
  end
end
