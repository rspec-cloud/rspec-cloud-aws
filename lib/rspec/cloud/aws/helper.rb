require 'rspec/cloud/aws/resources'

extend RSpec::Cloud::Aws::Resources

module Rspec
  module Core
    module ExampleGroup
      extend RSpec::Cloud::Aws::Resources
      include RSpec::Cloud::Aws::Resources
    end
  end
end
