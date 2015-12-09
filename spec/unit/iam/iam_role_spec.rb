require 'spec_helper'
require 'uri'

VCR.use_cassette('iam/role') do
  describe IamRole 'test' do
    let(:assume_role_policy_document) do
      "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ec2.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
    end

    its(:arn) { should match(%r/^arn:aws:iam::[\d]{12}:role\/test$/) }

    # its(:assume_role_policy_document) { should be_equal_to assume_role_policy_document }

    its(:create_date) { should eq Time.parse('2015-12-04 19:33:32 UTC') }

    its(:id) { should match(/^[A-Z0-9]{21}$/) }

    its(:path) { should be_equal_to '/' }

    its(:role_name) { should be_equal_to 'test' }
  end
end
