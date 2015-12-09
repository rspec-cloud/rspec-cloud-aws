require 'spec_helper'

VCR.use_cassette('ec2/placement_group') do
  describe PlacementGroup 'test' do
    it { should be_available }

    its(:group_name) { should be_equal_to 'test' }

    its(:strategy) { should be_equal_to 'cluster' }
  end
end
