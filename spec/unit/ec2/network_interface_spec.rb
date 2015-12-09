require 'spec_helper'

VCR.use_cassette('ec2/network_interface') do
  describe NetworkInterface 'test' do
    let(:group_set) do
      { /sg-[a-z0-9]{8}/ => 'default' }
    end

    let(:private_ip_addresses) do
      [
        {
          'privateIpAddress' => '192.168.0.126',
          'primary' => 'true',
          'item' => 'true'
        }
      ]
    end

    its(:association) { should be_empty }

    its(:attachment) { should be_empty }

    its(:availability_zone) { should be_equal_to 'eu-central-1a' }

    its(:description) { should be_equal_to 'test description' }

    # its(:group_set) { should match(group_set) }

    its(:owner_id) { should be_an(Integer) }

    its(:owner_id) { should have_digits(12) }

    its(:private_ip_addresses_set) { should be_empty }

    its(:private_ip_address) { should be_equal_to '192.168.0.126' }

    its(:private_ip_addresses) { should match(private_ip_addresses) }

    its(:id) { should match(/^eni-[a-z0-9]{8}$/) }

    its(:source_dest_check?) { should be_truthy }

    its(:status) { should be_equal_to 'available' }

    its(:subnet_id) { should match(/^subnet-[a-z0-9]{8}$/) }

    its(:tag_set) { should have(1).entry }

    its(:tag_set) { should have_key('Name').with_value('test') }

    its(:vpc_id) { should match(/^vpc-[a-z0-9]{8}$/) }
  end
end
