require 'spec_helper'

VCR.use_cassette('ec2/security_group') do
  describe SecurityGroup 'test' do
    let(:ip_permissions) do
      [
        {
          'groups' => [
            {
              'groupId' => /sg-[a-z0-9]{8}/,
              'userId' => /[\d]{12}/
            }
          ],
          'ipProtocol' => '-1',
          'ipRanges' => []
        }
      ]
    end

    let(:ip_permissions_egress) do
      [
        {
          'groups' => [],
          'ipProtocol' => '-1',
          'ipRanges' => [
            { 'cidrIp' => '0.0.0.0/0' }
          ]
        }
      ]
    end

    it { should be_default }

    its(:group_description) { should be_equal_to 'default VPC security group' }

    its(:group_name) { should be_equal_to 'default' }

    its(:id) { should match(/sg-[a-z0-9]{8}/) }

    its(:ip_permissions) { should match(ip_permissions) }

    its(:ip_permissions_egress) { should match(ip_permissions_egress) }

    its(:tag_set) { should have_key('Name').with_value('test') }

    its(:tag_set) { should have(1).entry }

    its(:vpc_id) { should match(/vpc-[a-z0-9]{8}/) }
  end
end
