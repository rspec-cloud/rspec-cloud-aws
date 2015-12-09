require 'spec_helper'

VCR.use_cassette('iam/policy') do
  describe IamPolicy 'arn:aws:iam::247761745453:policy/test' do
    its(:arn) { should match(%r/^arn:aws:iam::[\d]{12}:policy\/test$/) }

    its(:attachment_count) { should be 1 }

    its(:create_date) { should eq Time.parse('2015-11-15 10:14:12 UTC') }

    its(:default_version_id) { should be_equal_to 'v1' }

    its(:description) { should be_equal_to 'test description' }

    its(:id) { should match(/^[A-Z0-9]{21}$/) }

    its(:is_attachable?) { should be_truthy }

    its(:path) { should be_equal_to '/' }

    its(:policy_name) { should be_equal_to 'test' }

    its(:update_date) { should eq Time.parse('2015-11-15 10:14:12 UTC') }
  end
end
