module RSpec::Cloud::Aws::Resources
  class Instance < Base
    def availability_zone
      @resource['placement']['availabilityZone']
    end

    def current_resource
      @response ||= ec2.describe_instances('tag:Name' => @name).data[:body]['reservationSet'][0]['instancesSet']
      logger.debug @response
      @resource   = @response.first if @response.length == 1
      @identifier = 'instanceId'
    end

    def placement_group
      @resource['placement']['groupName']
    end

    def resource_name
      'Instance'
    end

    def running?
      result = false
      result = @resource['instanceState']['name'] == 'running' if @resource.key?('instanceState') && @resource['instanceState'].key?('name')
      result
    end

    def tenancy
      @resource['placement']['tenancy']
    end
  end
end
