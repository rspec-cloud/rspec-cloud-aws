require 'spec_helper'

VCR.use_cassette('ec2/address') do
  describe Address '52.29.62.30' do
    its(:allocation_id) { should match(/eipalloc-[a-z0-9]{8}/) }

    its(:domain) { should be_equal_to 'vpc' }

    its(:public_ip) { should be_equal_to '52.29.62.30' }
  end
end
