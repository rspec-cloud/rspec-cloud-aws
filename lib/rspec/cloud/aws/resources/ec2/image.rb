module RSpec::Cloud::Aws::Resources
  class Image < Base
    def available?
      valid? && @resource.key?('imageState') && @resource['imageState'] == 'available'
    end

    def current_resource
      @response ||= ec2.describe_images('tag:Name' => @name).data[:body]['imagesSet']
      @resource   = @response.first if @response.length == 1
      @identifier = 'imageId'
    end
    def public?
      valid? && @resource.key?('isPublic') && @resource['isPublic']
    end

    def resource_name
      'Image'
    end
  end
end
