require 'spec_helper'

VCR.use_cassette('ec2/image') do
  describe Image 'test' do
    let(:block_device_mapping) do
      [
        {
          'deviceName' => '/dev/sda1',
          'snapshotId' => /^snap-[a-z0-9]{8}$/,
          'volumeSize' => 8,
          'deleteOnTermination' => 'true',
          'volumeType' => 'gp2',
          'encrypted' => 'false'
        }
      ]
    end

    its(:architecture) { should be_equal_to 'x86_64' }

    its(:block_device_mapping) { should match(block_device_mapping) }

    its(:description) { should be_equal_to 'test description' }

    its(:hypervisor) { should be_equal_to 'xen' }

    its(:id) { should match(/^ami-[a-z0-9]{8}$/) }

    its(:image_location) { should match(%r/^[0-9]{12}\/test$/) }

    its(:image_owner_id) { should be_an(Integer) }

    its(:image_owner_id) { should have_digits(12) }

    its(:image_state) { should be_equal_to 'available' }

    its(:image_type) { should be_equal_to 'machine' }

    it { should_not be_public }

    its(:product_codes) { should be_empty }

    its(:root_device_name) { should be_equal_to '/dev/sda1' }

    its(:root_device_type) { should be_equal_to 'ebs' }

    its(:state_reason) { should be_empty }

    its(:tag_set) { should have(1).entry }

    its(:tag_set) { should have_key('Name').with_value('test') }

    its(:virtualization_type) { should be_equal_to 'hvm' }
  end
end
