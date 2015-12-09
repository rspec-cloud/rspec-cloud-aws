require 'spec_helper'

VCR.use_cassette('iam/group') do
  describe IamGroup 'test' do
    let(:users) do
      [
        {
          'Arn' => %r/^arn:aws:iam::[\d]{12}:user\/test$/,
          'Path' => '/',
          'UserId' => /^[A-Z0-9]{21}$/,
          'UserName' => 'test'
        }
      ]
    end

    its(:arn) { should match(%r/^arn:aws:iam::[\d]{12}:group\/test$/) }

    its(:group_name) { should be_equal_to 'test' }

    its(:id) { should match(/^[A-Z0-9]{21}$/) }

    its(:path) { should be_equal_to '/' }

    its(:users) { should match(users) }
  end
end
