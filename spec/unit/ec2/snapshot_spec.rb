require 'spec_helper'

VCR.use_cassette('ec2/snapshot') do
  describe Snapshot 'test' do
    its(:description) { should be_equal_to 'test description' }

    it { should_not be_encrypted }

    its(:id) { should match(/^snap-[a-z0-9]{8}$/) }

    its(:owner_id) { should be_an(Integer) }

    its(:owner_id) { should have_digits(12) }

    its(:progress) { should be_equal_to '100%' }

    its(:start_time) { should eq Time.parse('2015-12-06 12:58:06 UTC') }

    its(:status) { should be_equal_to 'completed' }

    its(:tag_set) { should have(1).entry }

    its(:tag_set) { should have_key('Name').with_value('test') }

    its(:volume_id) { should match(/^vol-[a-z0-9]{8}$/) }

    its(:volume_size) { should be 1 }
  end
end
