require 'spec_helper'

VCR.use_cassette('ec2/vpc') do
  describe Vpc 'test' do
    it { should be_available }

    its(:cidr_block) { should be_equal_to '192.168.0.0/24' }

    it { should_not be_default }

    its(:dhcp_options_id) { should match(/^dopt-[a-z0-9]{8}$/) }

    its(:id) { should match(/vpc-[a-z0-9]{8}/) }

    its(:instance_tenancy) { should have_value 'default' }

    its(:tag_set) { should have(1).entry }

    its(:tag_set) { should have_key('Name').with_value('test') }

    its(:vpc_id) { should match(/vpc-[a-z0-9]{8}/) }
  end
end
