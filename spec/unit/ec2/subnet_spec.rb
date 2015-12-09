require 'spec_helper'

VCR.use_cassette('ec2/subnet-1') do
  describe Subnet 'test-1' do
    it { should be_available }

    its(:available_ip_address_count) { should eq 123 }

    its(:availability_zone) { should be_equal_to 'eu-central-1a' }

    its(:cidr_block) { should be_equal_to '192.168.0.0/25' }

    its(:id) { should match(/subnet-[a-z0-9]{8}/) }

    its(:map_public_ip_on_launch?) { should be_truthy }

    its(:state) { should be_equal_to 'available' }

    its(:tag_set) { should have(1).entry }

    its(:tag_set) { should have_key 'Name' }

    its(:tag_set) { should have_key('Name').with_value('test-1') }

    its(:vpc_id) { should match(/vpc-[a-z0-9]{8}/) }
  end
end

VCR.use_cassette('ec2/subnet-2') do
  describe Subnet 'test-2' do
    it { should be_available }

    its(:available_ip_address_count) { should eq 123 }

    its(:availability_zone) { should be_equal_to 'eu-central-1a' }

    its(:cidr_block) { should be_equal_to '192.168.0.128/25' }

    its(:id) { should match(/subnet-[a-z0-9]{8}/) }

    its(:map_public_ip_on_launch?) { should be_truthy }

    its(:state) { should be_equal_to 'available' }

    its(:tag_set) { should have(1).entry }

    its(:tag_set) { should have_key 'Name' }

    its(:tag_set) { should have_key('Name').with_value('test-2') }

    its(:vpc_id) { should match(/vpc-[a-z0-9]{8}/) }
  end
end
