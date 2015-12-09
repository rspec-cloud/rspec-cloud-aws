module RSpec::Cloud::Aws::Resources
  class Snapshot < Base
    def current_resource
      @response ||= ec2.describe_snapshots('tag:Name' => @name).data[:body]['snapshotSet']
      @resource   = @response.first if @response.length == 1
      @identifier = 'snapshotId'
    end
  end
end
