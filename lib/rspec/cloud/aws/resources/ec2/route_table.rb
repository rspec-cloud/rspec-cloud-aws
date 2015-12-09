module RSpec::Cloud::Aws::Resources
  class RouteTable < Base
    def current_resource
      logger.debug ec2.describe_route_tables('tag:Name' => @name)
      @response ||= ec2.describe_route_tables('tag:Name' => @name).data[:body]['routeTableSet']
      @resource   = @response.first if @response.length == 1
      @identifier = 'routeTableId'
    end

    def default?
      @resource['associationSet'].any? { |h| h['main'] == true }
    end

    def resource_name
      %(Route table)
    end
  end
end
