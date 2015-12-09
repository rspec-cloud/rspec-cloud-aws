require 'spec_helper'

VCR.use_cassette('iam/user') do
  describe IamUser 'test' do
    its(:arn) { should match(%r/^arn:aws:iam::[\d]{12}:user\/test$/) }

    its(:create_date) { should eq Time.parse('2015-12-04 19:36:04 GMT') }

    its(:id) { should match(/^[A-Z0-9]{21}$/) }

    its(:path) { should be_equal_to '/' }

    its(:user_name) { should be_equal_to 'test' }
  end
end
