module RSpec::Cloud::Aws::Resources
  class PlacementGroup < Base
    def available?
      valid? && @resource.key?('state') && @resource['state'] == 'available'
    end

    def current_resource
      @response ||= ec2.describe_placement_groups('group-name' => @name).data[:body]['placementGroupSet']
      @resource   = @response.first if @response.length == 1
    end

    def resource_name
      %(Placement group)
    end
  end
end
