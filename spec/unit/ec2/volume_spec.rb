require 'spec_helper'

VCR.use_cassette('ec2/volume') do
  describe Volume 'test' do
    its(:attachment_set) { should be_empty }

    it { should be_available }

    its(:availability_zone) { should be_equal_to 'eu-central-1a' }

    its(:create_time) { should eq Time.parse('2015-12-06 12:55:55 UTC') }

    it { should_not be_encrypted }

    its(:id) { should match(/^vol-[a-z0-9]{8}$/) }

    its(:iops) { should be 3 }

    its(:size) { should be 1 }

    its(:snapshot_id) { should be_nil }

    its(:tag_set) { should have(1).entry }

    its(:tag_set) { should have_key('Name').with_value('test') }

    its(:volume_type) { should be_equal_to 'gp2' }
  end
end
