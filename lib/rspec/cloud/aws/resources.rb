module RSpec::Cloud::Aws
  module Resources
    autoload :Base, 'rspec/cloud/aws/resources/base/base'
    autoload :Support, 'rspec/cloud/aws/resources/base/support'

    path_name = Pathname.new(File.dirname(__FILE__) + '/resources')

    dir_name = Dir["#{path_name.realpath}/*"].delete_if { |name| name.end_with? 'base' }

    dir_name.each do |dir|
      files = Dir["#{dir}/*.rb"]

      resources = files.map { |file| Pathname.new(file).basename.to_s.gsub!('.rb', '') }

      resources.each do |resource|
        require "rspec/cloud/aws/resources/#{Pathname.new(dir).basename}/#{resource}"

        define_method resource.to_camel_case do |*args|
          class_name = "RSpec::Cloud::Aws::Resources::#{resource.to_camel_case}"

          Kernel.const_get(class_name).new args.first
        end
      end
    end
  end
end
