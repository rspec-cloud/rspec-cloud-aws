module RSpec::Cloud::Aws::Resources
  class Table < Base
    def current_resource
      @response ||= dynamodb.describe_table(@name).data[:body]['Table']
      @resource   = @response['Table'] if @response.key?('Table')
      @identifier = 'networkAclId'
    end

    def resource_name
      %(DynamoDB table)
    end
  end
end
